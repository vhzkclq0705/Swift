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
        print("Image size \(image.size)")
    }
    
    /// Fetch original image
    func fetchOriginalImage(completion: @escaping (UIImage?) -> Void) {
        fetchImage() { [weak self] data in
            let start = Date()
            guard let originalImage = UIImage(data: data) else {
                print("Failed to create UIImage.")
                completion(nil)
                return
            }
            
            let end = Date()
            print("_____downloadOriginalImage_____")
            print("Time: \(end.timeIntervalSince(start))")
            self?.displayInfoOfImage(originalImage)
            
            completion(originalImage)
        }
    }
    
    /// Downsample with UIGraphicsImageRenderer
    func downsampleWithUIRenderer(_ size: CGSize, completion: @escaping (UIImage?) -> Void) {
        fetchImage() { [weak self] data in
            let start = Date()
            guard let self = self,
                  let image = UIImage(data: data) else {
                print("Failed to create UIImage.")
                completion(nil)
                return
            }
            
            let originalSize = image.size
            let ratio = originalSize.width / originalSize.height
            let width = size.width
            let height = width / ratio
            let targetSize = originalSize.width > originalSize.height ?
                CGSize(width: width, height: height) :
                CGSize(width: width * ratio, height: width)
            
            let renderer = UIGraphicsImageRenderer(size: targetSize)
            let downsampledImage = renderer.image { context in
                image.draw(in: CGRect(origin: .zero, size: targetSize))
            }
            
            let end = Date()
            print("_____downsampledImageWithUIRenderer_____")
            print("Time: \(end.timeIntervalSince(start))")
            self.displayInfoOfImage(downsampledImage)
            
            completion(downsampledImage)
        }
    }
    
    /// Downsample with ImageIO
    func downsampleWithImageIO(_ size: CGSize, completion: @escaping (UIImage?) -> Void) {
        fetchImage() { [weak self] data in
            let start = Date()
            guard let self = self,
                  let imageSource = CGImageSourceCreateWithData(data as CFData, nil) else {
                print("Failed to create image source.")
                completion(nil)
                return
            }

            let options: [NSString: Any] = [
                kCGImageSourceThumbnailMaxPixelSize: max(size.width, size.height),
                kCGImageSourceCreateThumbnailFromImageAlways: true
            ]
            guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options as CFDictionary) else {
                print("Failed to downsample image source.")
                completion(nil)
                return
            }
            
            let image = UIImage(cgImage: downsampledImage)
            let end = Date()
            print("_____downsampledImageWithImageIO_____")
            print("Time: \(end.timeIntervalSince(start))")
            self.displayInfoOfImage(image)
            
            completion(image)
        }
    }
    
}
