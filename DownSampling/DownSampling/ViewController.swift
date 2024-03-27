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
    
    private lazy var originalButton: UIButton = {
        let button = UIButton()
        button.setTitle("원본", for: .normal)
        button.backgroundColor = .red
        
        return button
    }()
    
    private lazy var downsampleButton1: UIButton = {
        let button = UIButton()
        button.setTitle("UIImage", for: .normal)
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
        [imageView, originalButton, downsampleButton1, downsampleButton2]
            .forEach {
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        [originalButton, downsampleButton1, downsampleButton2]
            .forEach {
                $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            originalButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            originalButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            originalButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            originalButton.heightAnchor.constraint(equalToConstant: 50),
            
            downsampleButton1.topAnchor.constraint(equalTo: originalButton.bottomAnchor, constant: 20),
            downsampleButton1.leadingAnchor.constraint(equalTo: originalButton.leadingAnchor),
            downsampleButton1.trailingAnchor.constraint(equalTo: originalButton.trailingAnchor),
            downsampleButton1.heightAnchor.constraint(equalToConstant: 50),
            
            downsampleButton2.topAnchor.constraint(equalTo: downsampleButton1.bottomAnchor, constant: 20),
            downsampleButton2.leadingAnchor.constraint(equalTo: originalButton.leadingAnchor),
            downsampleButton2.trailingAnchor.constraint(equalTo: originalButton.trailingAnchor),
            downsampleButton2.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK:  Functions
    
    @objc func didTapButton(_ sender: UIButton) {
        switch sender {
        case originalButton:
            downsampler.fetchOriginalImage() { [weak self] image in
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }
        case downsampleButton1:
            downsampler.downsampleWithUIRenderer(size) { [weak self] image in
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }
        case downsampleButton2:
            downsampler.downsampleWithImageIO(size) { [weak self] image in
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }
        default:
            return
        }
    }
}
