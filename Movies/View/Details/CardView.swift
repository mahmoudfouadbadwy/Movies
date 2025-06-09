//
//  CardView.swift
//  Movies
//
//  Created by Mahmoud Fouad on 02/06/2025.
//

import SwiftUI

struct CardView: View {
    
    var review: ReviewResponse.Review
    
    var body: some View {
        VStack {
            HStack {
                let url = URL(string: NetworkConstants.imagePath + (review.authorDetails.avatarPath ?? ""))
                
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(1 ,contentMode: .fit)
                            .clipped()
                            .background(.white)
                    } else if phase.error != nil {
                        Image(systemName: Constants.Images.emptyPhoto.rawValue)
                            .resizable()
                            .aspectRatio(1 ,contentMode: .fit)
                            .background(.white)
                    } else {
                        Image(systemName: Constants.Images.emptyPhoto.rawValue)
                            .resizable()
                            .aspectRatio(1 ,contentMode: .fit)
                            .background(.white)
                    }
                }
                .frame(width: 80, height: 80)
                .border(Color.gray, width: 0.5)
                .clipShape(Circle())
                .padding()
                
                VStack (alignment: .leading) {
                    Text("Written by \(review.author)".uppercased())
                        .font(.caption)
                        .foregroundColor(.white)
                    
                    Text(review.createdAt)
                        .font(.caption)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            
            VStack(alignment: .leading) {
                
                Text(review.content)
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                
            }
            .padding()
            
            Spacer()
        }
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5))
        .padding(.horizontal, 8)
    }
}

#Preview {
    CardView(review: ReviewResponse.Review(author: "Ahmed",
                                           authorDetails:
                                            ReviewResponse.AuthorDetails(name: "Ahmed", avatarPath: "/yz2HPme8NPLne0mM8tBnZ5ZWJzf.jpg"), content: "content content  content content content content content content content content content content content content content  content content content content content content content content content content content content content  content content content content content content content content content content content content content  content content content content content content content content content content content", createdAt: "createdAt", id: "1", updatedAt: ""))
}
