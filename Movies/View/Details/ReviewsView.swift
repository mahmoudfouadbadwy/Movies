//
//  ReviewsView.swift
//  Movies
//
//  Created by Mahmoud Fouad on 01/06/2025.
//

import SwiftUI

struct ReviewsView: View {
    
    @Binding var reviews: [ReviewResponse.Review]
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(reviews) { review in
                        CardView(review: review)
                            .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
                    }
                }
            }
        }
    }
}




#Preview {
    ReviewsView(reviews: .constant(
        [
            ReviewResponse.Review(author: "Ahmed",
                                  authorDetails:
                                    ReviewResponse.AuthorDetails(name: "Ahmed", avatarPath: "/yz2HPme8NPLne0mM8tBnZ5ZWJzf.jpg"), content: "content", createdAt: "createdAt", id: "1", updatedAt: ""),
            ReviewResponse.Review(author: "Ahmed",
                                  authorDetails:
                                    ReviewResponse.AuthorDetails(name: "Ahmed", avatarPath: "/yz2HPme8NPLne0mM8tBnZ5ZWJzf.jpg"), content: "content", createdAt: "createdAt", id: "1", updatedAt: "")
         ]
    ))
}
