//
//  ViewController.swift
//  FrameVSBounds
//
//  Created by 권오준 on 2024-04-01.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: UI
    
    private lazy var safeArea = makeView("safeArea", .red)
    private lazy var firstView = makeView("firstView", .green)
    private lazy var secondView = makeView("secondView", .blue)

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "rootView"
        
        configureUI()
        configureLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        [view, safeArea, firstView, secondView].forEach {
            displayFrame($0)
        }
    }
    
    // MARK: - Configure
    
    private func configureUI() {
        [safeArea, firstView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        firstView.addSubview(secondView)
        secondView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            safeArea.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            safeArea.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            safeArea.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            safeArea.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            firstView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            firstView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            firstView.widthAnchor.constraint(equalToConstant: 300),
            firstView.heightAnchor.constraint(equalToConstant: 300),
            
            secondView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 20),
            secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            secondView.widthAnchor.constraint(equalToConstant: 200),
            secondView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // MARK: Functions
    
    private func makeView(_ name: String, _ color: UIColor) -> UIView {
        let view = UIView()
        view.accessibilityIdentifier = name
        view.backgroundColor = color
        
        return view
    }
    
    private func displayFrame(_ sender: UIView) {
        let fOrigin = sender.frame.origin
        let fSize = sender.frame.size
        let bOrigin = sender.bounds.origin
        let bSize = sender.bounds.size
        
        print("_______\(sender.accessibilityIdentifier!)_______")
        print("frame -> (x: \(fOrigin.x), y: \(fOrigin.y), width: \(fSize.width), height: \(fSize.height))")
        print("bounds -> (x: \(bOrigin.x), y: \(bOrigin.y), width: \(bSize.width), height: \(bSize.height))\n")
    }
    
}
