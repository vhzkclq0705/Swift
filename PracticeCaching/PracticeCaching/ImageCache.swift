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
    
    /// Load image from memory cache
    func loadImage(_ url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url = url else {
            completion(nil)
            return
        }
        
        // Check memory cache
        if let cachedImage = memoryCache.object(forKey: url.absoluteString as NSString) {
            Works.displayResult(.loadFromMemory, url.lastPathComponent)
            completion(cachedImage)
            return
        }
        
        // Check disk cache
        DispatchQueue.global().async {
            if let cachedImage = DiskCache.shared.loadImage(url) {
                // Save loaded image to memory
                self.saveImage(cachedImage, url)
                completion(cachedImage)
                return
            }
            
            if let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                // Save downloaded image to memory and disk
                self.saveImage(image, url)
                DiskCache.shared.saveImage(image, url)
                print("Newly downloaded the image.")
                completion(image)
            } else {
                print("Can't download the image.")
                completion(nil)
            }
            
        }
        
        
    }
    
    /// Save image to memory cache
    func saveImage(_ image: UIImage, _ url: URL) {
        memoryCache.setObject(image, forKey: url.absoluteString as NSString)
        Works.displayResult(.saveToMemory, url.lastPathComponent)
    }
    
}
