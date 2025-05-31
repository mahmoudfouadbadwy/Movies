//
//  DetailsView.swift
//  Movies
//
//  Created by Mahmoud Fouad on 30/05/2025.
//

import SwiftUI

struct DetailsView: View {
    
    @State var viewModel: HomeViewModel
    var movie: Movie
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text(movie.originalTitle)
                        .bold()
                        .foregroundStyle(.white)
                    
                    HStack {
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
                        }.frame(width: geometry.size.width / 2, height: geometry.size.width / 2)
                        
                        VStack {
                            Text(movie.releaseDate)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                                .padding()
                            
                            RatingView(rating: Int(movie.voteAverage / 2))
                                .padding()
                            
                            if let _movie = viewModel.getMovie(by: movie.id) {
                                Button {
                                    viewModel.toggleFavorite(movieId: movie.id)
                                } label: {
                                    Image(systemName: _movie.isFavorite ? "heart.fill" : "heart")
                                        .resizable()
                                        .animation(.default)
                                }
                                .frame(width: geometry.size.width * 0.1, height: geometry.size.width * 0.1)
                                .tint(_movie.isFavorite ? .red : .white)
                                .padding()
                            }
                        }
                    }
                    
                    Text(movie.overview)
                        .font(.body)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .padding()
                }
            }
            .frame(width: geometry.size.width)
            .background(.black)
        }
    }
}
