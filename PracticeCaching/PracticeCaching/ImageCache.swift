//
//  ImageCache.swift
//  PracticeCaching
//
//  Created by 권오준 on 2024-03-26.
//

import UIKit

class ImageCache: Cacheable {
    
    // MARK: Properties
    
    static let shared = ImageCache()
    private let memoryCache = NSCache<NSString, UIImage>()
    
    // MARK: Init
    
    private init() {}
    
    // MARK: Functions
    
    /// Load image from memory cache
    func loadImage(
        _ url: URL?,
        _ option: CacheOption = .both,
        completion: @escaping (UIImage?) -> Void)
    {
        guard let url = url else {
            completion(nil)
            return
        }
        
        let key = convertToKey(from: url)
        
        // Check memory cache
        if let cachedImage = memoryCache.object(forKey: key as NSString) {
            print("Load image from Memory")
            completion(cachedImage)
            return
        }
        
        // Check disk cache
        DispatchQueue.global().async {
            if let cachedImage = DiskCache.shared.loadImage(url) {
                // Save loaded image to memory
                self.saveImage(cachedImage, url, option)
                completion(cachedImage)
                return
            }
            
            if let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                // Save downloaded image to memory and disk
                print("Download the image.")
                self.saveImage(image, url, option)
                DiskCache.shared.saveImage(image, url, option)
                completion(image)
            } else {
                print("Not able to download the image.")
                completion(nil)
            }
        }
    }
    
    /// Save image to memory cache
    private func saveImage(_ image: UIImage, _ url: URL, _ option: CacheOption) {
        if option == .onlyDisk || option == .nothing {
            return
        }
        
        let key = convertToKey(from: url) as NSString
        memoryCache.setObject(image, forKey: key)
        print("Save image to memory")
    }
    
}
