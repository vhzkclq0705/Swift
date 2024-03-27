//
//  ViewController.swift
//  DownSampling
//
//  Created by 권오준 on 2024-03-27.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    // MARK: - Properties
    
    private let url = URL(string: "https://developer.apple.com/home/images/hero-wwdc24/phase1-awre32/b-wwdc24-hero-large-phase1_2x.webp")!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
        fetchImage()
    }
    
    // MARK: - Configure
    
    private func configureUI() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    // MARK: - Functions
    
    private func fetchImage() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self,
                  let imageData = try? Data(contentsOf: self.url),
                  let image = UIImage(data: imageData) else {
                print("This URL is not available.")
                return
            }
            
            self.displayInfoOfImage(imageData, image)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    private func displayInfoOfImage(_ data: Data, _ image: UIImage) {
        print("Data size: \(data.count) bytes")
        print("Image width: \(image.size.width), height: \(image.size.height)")
    }
    
}
