//
//  Model.swift
//  PracticeCaching
//
//  Created by 권오준 on 2024-03-26.
//

import Foundation

struct Response: Codable {
    let resultCount: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case movies = "results"
    }
}

struct Movie: Codable {
    let title: String
    let thumbnailPath: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case thumbnailPath = "artworkUrl100"
    }
}
