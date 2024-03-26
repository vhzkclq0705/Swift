//
//  DiskCache.swift
//  PracticeCaching
//
//  Created by 권오준 on 2024-03-26.
//

import UIKit

class DiskCache: Cacheable {
    
    // MARK: Properties
    
    static let shared = DiskCache()
    private let fileManager = FileManager.default
    
    // MARK: Init
    
    private init() {}
    
    
    // MARK: Functions
    
    /// Load image from disk cache
    func loadImage(_ url: URL) -> UIImage? {
        if let filePath = checkPath(url),
           fileManager.fileExists(atPath: filePath) {
            print("Load image from Disk")
            return UIImage(contentsOfFile: filePath)
        }
        
        return nil
    }
    
    /// Save image to disk cache
    func saveImage(_ image: UIImage, _ url: URL) {
        if let filePath = checkPath(url) {
            fileManager.createFile(
                atPath: filePath,
                contents: image.jpegData(compressionQuality: 1.0),
                attributes: nil)
            print("Save image to Disk")
        }
    }
    
    /// Check if the path of the file is valid
    private func checkPath(_ url: URL) -> String? {
        let key = convertToKey(from: url)
        let documentsURL = try? fileManager.url(
            for: .cachesDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true)
        let fileURL = documentsURL?.appendingPathComponent(key)
        
        return fileURL?.path
    }
    
}
