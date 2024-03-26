//
//  DiskCache.swift
//  PracticeCaching
//
//  Created by 권오준 on 2024-03-26.
//

import UIKit

class DiskCache {
    
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
            Works.displayResult(.loadFromDisk, url.lastPathComponent)
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
            Works.displayResult(.saveToDisk, url.lastPathComponent)
        }
    }
    
    /// Check if the path of the file is valid
    private func checkPath(_ url: URL) -> String? {
        let documentsURL = try? fileManager.url(
            for: .cachesDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true)
        let fileURL = documentsURL?.appendingPathComponent(url.lastPathComponent)
        
        return fileURL?.path
    }
    
}
