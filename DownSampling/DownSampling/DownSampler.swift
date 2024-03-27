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
        guard let data = image.jpegData(compressionQuality: 1.0) else { return }
        print("Data size: \(data.count) bytes")
        print("Image width: \(image.size.width), height: \(image.size.height)")
    }
    
    /// Downsample with UIImage
    func downsampleWithUIImage(_ scale: CGFloat, completion: @escaping (UIImage) -> Void) {
        fetchImage() { [weak self] data in
            guard let image = UIImage(data: data) else { return }
            let start = Date()
            
            let width = image.size.width * scale
            let height = image.size.height * scale
            let size = CGSize(width: width, height: height)
            let renderer = UIGraphicsImageRenderer(size: size)
            let resizedImage = renderer.image { context in
                image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            }
            
            let end = Date()
            let interval = end.timeIntervalSince(start)
            
            print("_____resizedImageWithUIRenderer_____")
            print("Time: \(end.timeIntervalSince(start))")
            self?.displayInfoOfImage(resizedImage)
            
            completion(resizedImage)
        }
    }
    
    /// Downsample with ImageIO
    
    /// Dwonsample with 
    
}
