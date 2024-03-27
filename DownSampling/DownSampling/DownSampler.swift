//
//  DownSampler.swift
//  DownSampling
//
//  Created by 권오준 on 2024-03-27.
//

import UIKit

class DownSampler {
    
    // MARK: Properties
    
    private let url = URL(string: "https://developer.apple.com/home/images/hero-wwdc24/phase1-awre32/b-wwdc24-hero-large-phase1_2x.webp")!
    
    // MARK: Init
    
    init() {}
    
    // MARK: Functions
    
    /// Fetch Image
    private func fetchImage(completion: @escaping (Data) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to download image.")
                return
            }
            
            print("Successed to download image.")
            completion(data)
        }.resume()
    }
    
    /// Print information of image
    private func displayInfoOfImage(_ image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 1.0) else {
            print("Failed to create JPEG data.")
            return
        }
        print("Data size: \(data.count) bytes")
    }
    
    /// Downsample with UIImage
    func downsampleWithUIImage(
        _ scale: CGFloat,
        completion: @escaping (UIImage?) -> Void)
    {
        fetchImage() { [weak self] data in
            let start = Date()
            guard let image = UIImage(data: data) else {
                print("Failed to create UIImage.")
                completion(nil)
                return
            }
            
            let width = image.size.width * scale
            let height = image.size.height * scale
            let size = CGSize(width: width, height: height)
            let renderer = UIGraphicsImageRenderer(size: size)
            let downsampledImage = renderer.image { context in
                image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            }
            
            let end = Date()
            let interval = end.timeIntervalSince(start)
            
            print("_____resizedImageWithUIRenderer_____")
            print("Time: \(end.timeIntervalSince(start))")
            self?.displayInfoOfImage(downsampledImage)
            
            completion(downsampledImage)
        }
    }
    
    /// Downsample with ImageIO
    func downsampleWithImageIO(
        _ size: CGSize,
        _ scale: CGFloat,
        completion: @escaping (UIImage?) -> Void)
    {
        fetchImage() { [weak self] data in
            let start = Date()
            guard let imageSource = CGImageSourceCreateWithData(data as CFData, nil) else {
                print("Failed to create image source.")
                completion(nil)
                return
            }
            
            let options1: [NSString: Any] = [kCGImageSourceShouldCache: false]
            guard let properties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, options1 as CFDictionary) as? [String: Any],
                  let width = properties[kCGImagePropertyPixelWidth as String] as? CGFloat,
                  let height = properties[kCGImagePropertyHeight as String] as? CGFloat else {
                print("Failed to get image size")
                completion(nil)
                return
            }
            
            let options2: [NSString: Any] = [
                kCGImageSourceThumbnailMaxPixelSize: max(width, height) * scale,
                kCGImageSourceCreateThumbnailFromImageAlways: true
            ]
            guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options2 as CFDictionary) else {
                print("Failed to downsample image source.")
                completion(nil)
                return
            }
            
            let image = UIImage(cgImage: downsampledImage)
            let end = Date()
            let interval = end.timeIntervalSince(start)
            
            print("_____resizedImageWithUIRenderer_____")
            print("Time: \(end.timeIntervalSince(start))")
            self?.displayInfoOfImage(image)
            
            completion(image)
        }
    }
    
}
