//
//  HomeViewModel.swift
//  Movies
//
//  Created by Mahmoud Fouad on 25/05/2025.
//

import Foundation
import SwiftUI


@Observable class HomeViewModel {
    private let networkService: NetworkService
    
    var movies: [Movie] = []
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadMovies() async throws {
        do {
            let moviesData: MoviesData =  try await networkService.makeRequest(url: NetworkConstants.moviesUrl)
            self.movies = moviesData.movies
        } catch {
            throw(error)
        }
    }
}
