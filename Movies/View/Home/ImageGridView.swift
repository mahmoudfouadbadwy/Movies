//
//  ImageGridView.swift
//  Movies
//
//  Created by Mahmoud Fouad on 26/05/2025.
//

import SwiftUI

struct ImageGridView: View {
    
    @State var viewModel: MovieViewModel
    @Binding var movieGenre: MovieType
   
    
    private let columns = [ GridItem(.flexible()), GridItem(.flexible())]
    private var movies: [Movie] {
        viewModel.movies.filter { movie in
            return (movieGenre == .all || movie.genreIDS.contains(movieGenre.id) || (movieGenre == .favorite && movie.isFavorite))
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                lazzyGridView(geometry)
            }
            .background(.black)
            
        }
    }
    
    private func lazzyGridView(_ geometry: GeometryProxy) -> some View  {
        LazyVGrid(columns: columns) {
            ForEach(movies) { movie in
                NavigationLink(value: movie) {
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
                            Image(systemName: Constants.Images.emptyPhoto.rawValue)
                        }
                    }.frame(width: geometry.size.width / 2, height: geometry.size.width / 2)
                        .task {
                            await loadMoreMovies(currentMovie: movie)
                        }
                }
            }
        }
    }
}

extension ImageGridView {
    private func loadMoreMovies(currentMovie: Movie) async {
        guard viewModel.movies.last?.id == currentMovie.id else {
            return
        }
        do {
            try await viewModel.loadMoreMovies()
        } catch {
            print(error)
        }
    }
}

