//
//  ImageCache.swift
//  PracticeCaching
//
//  Created by 권오준 on 2024-03-26.
//

import UIKit

class ImageCache {
    
    // MARK: Properties
    
    static let shared = ImageCache()
    private let memoryCache = NSCache<NSString, UIImage>()
    
    // MARK: Init
    
    private init() {}
    
    // MARK: Functions
    
    func loadImages(_ url: URL, completion: (UIImage?) -> Void) {
        // Check memory cache
        if let cachedImage = memoryCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
            return
        }
        
        // Check disk cache
        
    }
}
