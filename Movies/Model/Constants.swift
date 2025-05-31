//
//  Constants.swift
//  Movies
//
//  Created by Mahmoud Fouad on 24/05/2025.
//


struct Constants {
     public static let mainTitle = "Movies"
     public static let loadingText = "Loading..."
     public static let loadingFailed = "Failed to load the Movies"
     public static let oopsErrorTitle = "Oops!"
     public static let retryTitle = "Retry"
     public static let noImageAvailable = "No image available"
    
    
    enum Images: String {
        case emptyPhoto = "photo"
        case fillHeart = "heart.fill"
        case defaultHeart = "heart"
        case noNetwork = "wifi.exclamationmark"
        case rating = "star.fill"
    }
}
