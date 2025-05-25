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
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if loadingFailed {
                ErrorView(message: "Failed to load the Movies") {
                    Task {
                        await self.loadMovies()
                    }
                }
            } else {
                GeometryReader { gemoetry in
                    ScrollView(.vertical, showsIndicators: false) {
                        ImageGridView(movies: $viewModel.movies, width: gemoetry.size.width / 2)
                    }
                    .background(.black)
                }
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
