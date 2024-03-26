//
//  API.swift
//  PracticeCaching
//
//  Created by 권오준 on 2024-03-26.
//

import Foundation

class API {
    
    static func searchMovies(_ term: String, completion: @escaping ([Movie]) -> Void) {
        var components = URLComponents(string: "https://itunes.apple.com/search?")!
        let media = URLQueryItem(name: "media", value: "movie")
        let entity = URLQueryItem(name: "entity", value: "movie")
        let movieName = URLQueryItem(name: "term", value: term)
        
        components.queryItems = [media, entity, movieName]
        
        guard let url = components.url else {
            fatalError("URL error")
        }
        
        URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            let successRange = 200..<300
            
            guard error == nil,
                  let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  successRange.contains(statusCode) else {
                completion([])
                return
            }
            
            guard let resultData = data else {
                completion([])
                return
            }
            
            // data -> [Movie]
            completion(parseMovies(resultData))
        }.resume()
    }
    
    static func parseMovies(_ data: Data) -> [Movie] {
        let decoder = JSONDecoder()
        
        do {
            let response = try decoder.decode(Response.self, from: data)
            return response.movies
        } catch let error {
            print("--> parsing error: \(error.localizedDescription)")
            return []
        }
    }
    
}

