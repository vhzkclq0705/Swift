//
//  Cell.swift
//  DownSampling
//
//  Created by 권오준 on 2024-03-28.
//

import UIKit

class Cell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let id = "cell"
    
    // MARK: UI
    
    private lazy var imageView = UIImageView()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    
    private func configureUI() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: Functions
    
    func updateImageView(image: UIImage?) {
        imageView.image = image
    }
    
}
