//
//  ViewController.swift
//  DownSampling
//
//  Created by 권오준 on 2024-03-27.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:  UI
    
    private lazy var imageView = UIImageView()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        
        return collectionView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var originalButton: UIButton = {
        let button = UIButton()
        button.setTitle("Original", for: .normal)
        button.backgroundColor = .red
        
        return button
    }()
    
    private lazy var downsampleButton1: UIButton = {
        let button = UIButton()
        button.setTitle("UIRenderer", for: .normal)
        button.backgroundColor = .green

        return button
    }()
    
    private lazy var downsampleButton2: UIButton = {
        let button = UIButton()
        button.setTitle("ImageIO", for: .normal)
        button.backgroundColor = .blue
        
        return button
    }()
    
    // MARK: Properties
    
    private let downsampler = DownSampler()
    private lazy var size = imageView.frame.size
    
    // MARK:  Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
    }
    
    // MARK:  Configure
    
    private func configureUI() {
        [originalButton, downsampleButton1, downsampleButton2]
            .forEach { stackView.addArrangedSubview($0) }
        
        [collectionView, stackView]
            .forEach {
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        [originalButton, downsampleButton1, downsampleButton2]
            .forEach {
                $0.addTarget(self, action: #selector(fetchImage(_:)), for: .touchUpInside)
            }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK:  Functions
    
    @objc func fetchImage(_ sender: UIButton) {
        
        print(sender.titleLabel?.text)
//        downsampler.fetchImage(size, <#T##FetchOptions#>, completion: <#T##(UIImage?) -> Void#>)
    }
}
