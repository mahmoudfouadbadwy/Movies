//
//  HomeViewModel.swift
//  Movies
//
//  Created by Mahmoud Fouad on 25/05/2025.
//

import Foundation
import SwiftUI


@Observable class HomeViewModel {
    var movies: [Movie] = []
    
    private let networkService: NetworkService
    private var currentPage = 1
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadMovies(page: Int = 1) async throws {
        do {
            let moviesData: MoviesData =  try await networkService.makeRequest(url: "\(NetworkConstants.moviesUrl)&page=\(page)")
            var newMovies: [Movie] = []
            if (page == 1) {
                newMovies = moviesData.movies
            } else {
                let filteredMovies = Set(moviesData.movies)
                newMovies = filteredMovies.filter { responseMovie in
                    !self.movies.contains {movie in responseMovie.id == movie.id}
                }
            }
            self.movies.append(contentsOf: newMovies)
            self.movies.forEach { print("Movie id ", $0.id)}
            self.currentPage = moviesData.page
        } catch {
            throw(error)
        }
    }
    
    func loadMoreMovies() async throws {
        do {
            try await self.loadMovies(page: currentPage + 1)
        } catch {
            throw(error)
        }
    }
}
