//
//  DownSampler.swift
//  DownSampling
//
//  Created by 권오준 on 2024-03-27.
//

import UIKit

enum FetchOptions: String {
    case original = "OriginalImage"
    case uiRenderer = "DownsampledImageWithUIRenderer"
    case imageIO = "DownsampledImageWithImageIO"
}

class DownSampler {
    
    // MARK: Properties
    
    private let url = URL(string: "https://developer.apple.com/home/images/hero-wwdc24/phase1-awre32/b-wwdc24-hero-large-phase1_2x.webp")!
    
    // MARK: Init
    
    init() {}
    
    // MARK: Functions
    
    /// Fetch image with option
    func fetchImage(_ size: CGSize, _ option: FetchOptions, completion: @escaping (UIImage?) -> Void) {
        switch option {
        case .original:
            fetchOriginalImage(completion: completion)
        case .uiRenderer:
            downsampleWithUIRenderer(size, completion: completion)
        case .imageIO:
            downsampleWithImageIO(size, completion: completion)
        }
    }
    
    /// Fetch original image
    private func fetchOriginalImage(completion: @escaping (UIImage?) -> Void) {
        fetchData() { [weak self] data, start in
            guard let originalImage = UIImage(data: data) else {
                print("Failed to create UIImage.")
                completion(nil)
                return
            }
            
            self?.displayInfoOfImage(.original, originalImage, start)
            completion(originalImage)
        }
    }
    
    /// Downsample with UIGraphicsImageRenderer
    private func downsampleWithUIRenderer(_ size: CGSize, completion: @escaping (UIImage?) -> Void) {
        fetchData() { [weak self] data, start in
            guard let image = UIImage(data: data) else {
                print("Failed to create UIImage.")
                completion(nil)
                return
            }
            
            // Resize image to size maintaining original ratio
            let originalSize = image.size
            let ratio = originalSize.width / originalSize.height
            let targetSize = originalSize.width > originalSize.height ?
                CGSize(width: size.width, height: size.width / ratio) :
                CGSize(width: size.width * ratio, height: size.width)
            
            // Start downsample
            let renderer = UIGraphicsImageRenderer(size: targetSize)
            let downsampledImage = renderer.image { _ in
                image.draw(in: CGRect(origin: .zero, size: targetSize))
            }
        
            self?.displayInfoOfImage(.uiRenderer, downsampledImage, start)
            completion(downsampledImage)
        }
    }
    
    /// Downsample with ImageIO
    private func downsampleWithImageIO(_ size: CGSize, completion: @escaping (UIImage?) -> Void) {
        fetchData() { [weak self] data, start in
            guard let imageSource = CGImageSourceCreateWithData(data as CFData, nil) else {
                print("Failed to create image source.")
                completion(nil)
                return
            }
            
            // Resize image to size
            let options: [NSString: Any] = [
                kCGImageSourceThumbnailMaxPixelSize: max(size.width, size.height),
                kCGImageSourceCreateThumbnailFromImageAlways: true,
            ]
            
            // Start downsample
            guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options as CFDictionary) else {
                print("Failed to downsample image source.")
                completion(nil)
                return
            }
            
            let image = UIImage(cgImage: downsampledImage)
            self?.displayInfoOfImage(.imageIO, image, start)
            completion(image)
        }
    }
    
    /// Fetch data
    private func fetchData(completion: @escaping (Data, Date) -> Void) {
        let start = Date()
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to download image.")
                return
            }
            
            completion(data, start)
        }.resume()
    }
    
    /// Print image information
    private func displayInfoOfImage(_ option: FetchOptions, _ image: UIImage, _ start: Date) {
        guard let data = image.jpegData(compressionQuality: 1.0) else {
            print("Failed to create JPEG data.")
            return
        }
        
        print("____\(option.rawValue)____")
        print("Time: \(Date().timeIntervalSince(start))")
        print("Data size: \(data.count) bytes")
        print("Image size \(image.size)")
    }
    
}
