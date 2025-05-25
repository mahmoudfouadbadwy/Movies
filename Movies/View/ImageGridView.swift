//
//  ImageGridView.swift
//  Movies
//
//  Created by Mahmoud Fouad on 26/05/2025.
//

import SwiftUI

struct ImageGridView: View {
    
    @Binding var movies: [Movie]
    var width: CGFloat = 0
    
    private let columns = [ GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(movies) { movie in
                let url = URL(string: Constants.imagePath + movie.posterPath)
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(1 ,contentMode: .fit)
                            .clipped()
                    } else if phase.error != nil {
                        Text("No image available")
                    } else {
                        Image(systemName: "photo")
                    }
                }.frame(width: width, height: width)
            }
        }
    }
}

#Preview {
    ImageGridView(movies: .constant([]))
}
