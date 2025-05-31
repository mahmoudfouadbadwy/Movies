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
        // Large Navigation Title
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        // Inline Navigation Title
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                let viewModel = HomeViewModel(networkService: NetworkService())
                HomeView(viewModel: viewModel)
                    .navigationDestination(for: Movie.self) { movie in
                        DetailsView(viewModel: viewModel, movie: movie)
                    }
                    .navigationTitle(Constants.mainTitle)
                    .navigationBarTitleDisplayMode(.large)
                    .foregroundStyle(.white)
            }
        }
    }
}

extension Binding: @retroactive Hashable where Value: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.wrappedValue.hashValue)
    }
}

extension Binding: @retroactive Equatable where Value: Equatable {
    public static func == (lhs: Binding<Value>, rhs: Binding<Value>) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}
