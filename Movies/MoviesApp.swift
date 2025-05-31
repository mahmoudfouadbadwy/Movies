//
//  MoviesApp.swift
//  Movies
//
//  Created by Mahmoud Fouad on 24/05/2025.
//

import SwiftUI

@main
struct MoviesApp: App {
    
    init() {
        self.setupTapBarView()
        self.setupNavigationBarView()
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack {
                    let viewModel = MovieViewModel(networkService: NetworkService())
                    HomeView(viewModel: viewModel)
                        .navigationTitle(Constants.mainTitle)
                        .navigationBarTitleDisplayMode(.large)
                        .foregroundStyle(.white)
                        .navigationDestination(for: Movie.self) { movie in
                            DetailsView(viewModel: viewModel, movie: movie)}
                }
                .tabItem {
                    Label("Movies", systemImage: "house.fill")
                        .padding(.vertical)
                }
            }
            .font(.body)
            .accentColor(Color.white)
        }
    }
}


private extension MoviesApp {
   
    func setupNavigationBarView() {
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        // Inline Navigation Title
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    func setupTapBarView() {
        UITabBar.appearance().barTintColor = .black
    }
}
