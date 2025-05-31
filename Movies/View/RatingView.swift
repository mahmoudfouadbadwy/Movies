//
//  RatingView.swift
//  Movies
//
//  Created by Mahmoud Fouad on 30/05/2025.
//

import SwiftUI

struct RatingView: View {
   
    var rating: Int
    var label = ""
    var maximumRating = 5
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Image(systemName: "star.fill")
                        .foregroundStyle(number > rating ? offColor : onColor)
            }
        }
    }
}

#Preview {
    RatingView(rating: 3)
}
