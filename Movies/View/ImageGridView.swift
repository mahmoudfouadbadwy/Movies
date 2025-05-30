//
//  ImageGridView.swift
//  Movies
//
//  Created by Mahmoud Fouad on 26/05/2025.
//

import SwiftUI

struct ImageGridView: View {
    
    @State var viewModel: HomeViewModel
    @State private var isLoading = false
    private let columns = [ GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        GeometryReader { gemoetry in
            
            if isLoading {
                ProgressView(Constants.loadingText)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tint(.white)
            }
            
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.movies) { movie in
                        let url = URL(string: NetworkConstants.imagePath + movie.posterPath)
                        AsyncImage(url: url) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(1 ,contentMode: .fit)
                                    .clipped()
                            } else if phase.error != nil {
                                Text(Constants.noImageAvailable)
                            } else {
                                Image(systemName: "photo")
                            }
                        }.frame(width: gemoetry.size.width / 2, height: gemoetry.size.width / 2)
                         .task {
                             await loadMoreMovies(currentMovie: movie)
                         }
                    }
                }
            }
            .background(.black)
        }
    }
}

extension ImageGridView {
    private func loadMoreMovies(currentMovie: Movie) async {
        guard viewModel.movies.last?.id == currentMovie.id else {
            return
        }
        do {
            isLoading = true
            try await viewModel.loadMoreMovies()
            isLoading = false
        } catch {
            isLoading = false
        }
    }
}

