//
//  Cell.swift
//  PracticeCaching
//
//  Created by 권오준 on 2024-03-26.
//

import UIKit

class Cell: UICollectionViewCell {
    
    static let id = "Cell"
    
    // MARK: - UI
    
    private lazy var imageView = UIImageView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    private func configureUI() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    // MARK: - Functions
    
    public func updateImageView(img: UIImage?) {
        imageView.image = img
    }
    
}
