//
//  Review.swift
//  Movies
//
//  Created by Mahmoud Fouad on 01/06/2025.
//

typealias reviews = [ReviewResponse.Review]


struct ReviewResponse: Codable {
    
    let reviews: [Review]
    
    enum CodingKeys: String, CodingKey {
        case reviews = "results"
    }
    
    struct Review: Codable, Identifiable {
        let author: String
        let authorDetails: AuthorDetails
        let content, createdAt, id, updatedAt: String
        
        enum CodingKeys: String, CodingKey {
            case author
            case authorDetails = "author_details"
            case content
            case createdAt = "created_at"
            case id
            case updatedAt = "updated_at"
        }
    }
    struct AuthorDetails: Codable {
        let name: String
        let avatarPath: String?
        
        enum CodingKeys: String, CodingKey {
            case name
            case avatarPath = "avatar_path"
        }
    }
}
