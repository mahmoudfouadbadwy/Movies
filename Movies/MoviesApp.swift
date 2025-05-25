//
//  MoviesApp.swift
//  Movies
//
//  Created by Mahmoud Fouad on 24/05/2025.
//

import SwiftUI

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(networkService: NetworkService()))
        }
    }
}
