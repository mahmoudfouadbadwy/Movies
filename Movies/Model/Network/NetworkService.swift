//
//  NetworkService.swift
//  Movies
//
//  Created by Mahmoud Fouad on 24/05/2025.
//

import Foundation

struct NetworkService {
    
     func makeRequest<T: Codable> (url: String) async throws -> T {
        
        guard let requestURL = URL(string: url) else {
            throw (InternalErrors.invalidURL)
        }
        let session = URLSession(configuration: .default)
        
        do {
            let (data, response) = try await session.data(from: requestURL)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw (InternalErrors.serverError)
            }
            
            guard let result = try? JSONDecoder().decode(T.self, from: data) else {
                throw (InternalErrors.decodeingError)
            }
            print("✅✅✅✅✅✅✅✅✅")
            return result
            
        } catch {
            print("🧨🧨🧨🧨🧨🧨🧨🧨🧨 \(error.localizedDescription)")
            throw (InternalErrors.unexpectedError )
        }
    }
}


enum InternalErrors: String, Error {
    case invalidURL = "The provided url is invalid."
    case serverError = "The server responded with an error."
    case decodeingError = "Error while decoding the response."
    case unexpectedError = "Unexpected error Occurred."
}
