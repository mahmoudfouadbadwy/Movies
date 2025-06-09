//
//  NetworkConstants.swift
//  Movies
//
//  Created by Mahmoud Fouad on 24/05/2025.
//

struct NetworkConstants {
    
    private static let baseURL = "http://api.themoviedb.org/3/discover/movie?"
    
    static let moviesUrl = "\(baseURL)api_key=d52a9c41632a8b38d8c0dd5b5652b937"
    static let imagePath = "http://image.tmdb.org/t/p/w185/"
    static let reviewPath = "https://api.themoviedb.org/3/movie/"
    static let reviewPath2 = "/reviews?api_key=d52a9c41632a8b38d8c0dd5b5652b937"
}
