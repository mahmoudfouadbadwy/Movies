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
        self.setupNavigationBarView()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                let viewModel = MovieViewModel(networkService: NetworkService())
                HomeView(viewModel: viewModel)
                    .navigationTitle(Constants.mainTitle)
                    .navigationBarTitleDisplayMode(.large)
                    .foregroundStyle(.white)
                    .navigationDestination(for: Movie.self) { movie in
                        DetailsView(viewModel: viewModel, movie: movie)}
            }
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
}
