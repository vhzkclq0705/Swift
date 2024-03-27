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
    
    private lazy var fetchButton: UIButton = {
        let button = UIButton()
        button.setTitle("원본 다운로드", for: .normal)
        button.tintColor = .green
        
        return button
    }()
    
    private lazy var downsampleButton1: UIButton = {
        let button = UIButton()
        button.setTitle("원본 다운로드", for: .normal)
        button.tintColor = .green
        
        return button
    }()
    
    private lazy var downsampleButton2: UIButton = {
        let button = UIButton()
        button.setTitle("원본 다운로드", for: .normal)
        button.tintColor = .green
        
        return button
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
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
    

    
}
