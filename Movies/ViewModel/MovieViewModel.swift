//
//  HomeViewModel.swift
//  Movies
//
//  Created by Mahmoud Fouad on 25/05/2025.
//

import Foundation
import SwiftUI


@MainActor @Observable class MovieViewModel {
   
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
                let uniqueMovies = Set(moviesData.movies)
                newMovies = uniqueMovies.filter { responseMovie in
                    !self.movies.contains {movie in responseMovie.id == movie.id}
                }
            }
            self.movies.append(contentsOf: newMovies)
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
    
    func toggleFavorite(movieId: Int) {
        for (index, movie) in self.movies.enumerated() {
            if movie.id == movieId {
                self.movies[index].isFavorite.toggle()
            }
        }
    }
    
    func getMovie(by id: Int) -> Movie? {
        let _Movies = self.movies.filter {$0.id == id}
        guard _Movies.isEmpty == false else {
            return nil
        }
        return _Movies[0]
    }
    
    func getReviews(for id: Int) async throws -> ReviewResponse {
        let url = NetworkConstants.reviewPath + "\(id)" + NetworkConstants.reviewPath2
        do {
            let reviews: ReviewResponse = try await networkService.makeRequest(url: url)
            print(reviews)
            return reviews
        } catch {
            throw(error)
        }
    }
}
