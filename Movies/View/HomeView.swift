//
//  Home.swift
//  Movies
//
//  Created by Mahmoud Fouad on 24/05/2025.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel: HomeViewModel
    @State private var isLoading = false
    @State private var loadingFailed = false
    
    var body: some View {
        Group {
            if isLoading {
                ProgressView(Constants.loadingText)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            if loadingFailed {
                ErrorView(message: Constants.loadingFailed) {
                    Task {
                        await loadMovies()
                    }
                }
            } else {
                ImageGridView(viewModel: viewModel)
            }
        }.task {
            await loadMovies()
        }
    }
}

extension HomeView {
    private func loadMovies() async {
        isLoading = true
        loadingFailed = false
        do {
            try await viewModel.loadMovies()
            isLoading = false
        } catch {
            loadingFailed = true
            isLoading = false
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(networkService: NetworkService()))
}
