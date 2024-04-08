//
//  SecondViewController.swift
//  FrameVSBounds
//
//  Created by 권오준 on 2024-04-04.
//

import UIKit

#Preview {
    SecondViewController()
}

class SecondViewController: UIViewController {
    
    // MARK: UI
    
    private lazy var firstView = makeView(.red)
    private lazy var secondView = makeView(.yellow)
    
    
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureUI()
        configureLayout()
    }
    
    // MARK: Configure
    
    private func configureUI() {
        [firstView, secondView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            firstView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            firstView.widthAnchor.constraint(equalToConstant: 300),
            firstView.heightAnchor.constraint(equalToConstant: 300),
            
            secondView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 30),
            secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 30),
            secondView.widthAnchor.constraint(equalToConstant: 150),
            secondView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    // MARK: Functions
    
    private func makeView(_ color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        
        return view
    }
    
}
