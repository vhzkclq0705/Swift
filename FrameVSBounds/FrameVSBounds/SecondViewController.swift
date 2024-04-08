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
    
    private lazy var firstView = makeView(.firstView)
    private lazy var secondView = makeView(.secondView)
    
    private lazy var firstFrameXLabel = makeLable("FirstView_Frame_X")
    private lazy var firstFrameYLabel = makeLable("FirstView_Frame_Y")
    private lazy var firstOriginXLabel = makeLable("FirstView_Origin_X")
    private lazy var firstOriginYLabel = makeLable("FirstView_Origin_Y")
    
    private lazy var firstFrameXSlider = makeSlider(.firstView)
    private lazy var firstFrameYSlider = makeSlider(.firstView)
    private lazy var firstOriginXSlider = makeSlider(.firstView)
    private lazy var firstOriginYSlider = makeSlider(.firstView)
    
    private lazy var secondFrameXLabel = makeLable("SecondView_Frame_X")
    private lazy var secondFrameYLabel = makeLable("SecondView_Frame_Y")
    private lazy var secondOriginXLabel = makeLable("SecondView_Origin_X")
    private lazy var secondOriginYLabel = makeLable("SecondView_Origin_Y")
    
    private lazy var secondFrameXSlider = makeSlider(.secondView)
    private lazy var secondFrameYSlider = makeSlider(.secondView)
    private lazy var secondOriginXSlider = makeSlider(.secondView)
    private lazy var secondOriginYSlider = makeSlider(.secondView)
    
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureUI()
        configureLayout()
    }
    
    // MARK: Configure
    
    private func configureUI() {
        [
            firstView,
            secondView,
            firstFrameXLabel,
            firstFrameYLabel,
            firstOriginXLabel,
            firstOriginYLabel,
            firstFrameXSlider,
            firstFrameYSlider,
            firstOriginXSlider,
            firstOriginYSlider,
            secondFrameXLabel,
            secondFrameYLabel,
            secondOriginXLabel,
            secondOriginYLabel,
            secondFrameXSlider,
            secondFrameYSlider,
            secondOriginXSlider,
            secondOriginYSlider
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30),
            firstView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            firstView.widthAnchor.constraint(equalToConstant: 300),
            firstView.heightAnchor.constraint(equalToConstant: 300),
            
            secondView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 30),
            secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 30),
            secondView.widthAnchor.constraint(equalToConstant: 150),
            secondView.heightAnchor.constraint(equalToConstant: 150),
            
            firstFrameXLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 50),
            firstFrameXLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -100),
            
            firstFrameYLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 50),
            firstFrameYLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 100),
            
            firstFrameXSlider.topAnchor.constraint(equalTo: firstFrameXLabel.topAnchor, constant: 10),
            firstFrameXSlider.centerXAnchor.constraint(equalTo: firstFrameXLabel.centerXAnchor),
            firstFrameXSlider.widthAnchor.constraint(equalTo: firstFrameXLabel.widthAnchor),
            
            firstFrameYSlider.topAnchor.constraint(equalTo: firstFrameYLabel.topAnchor, constant: 10),
            firstFrameYSlider.centerXAnchor.constraint(equalTo: firstFrameYLabel.centerXAnchor),
            firstFrameYSlider.widthAnchor.constraint(equalTo: firstFrameYLabel.widthAnchor),
            
            firstOriginXLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 100),
            firstOriginXLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -100),
            
            firstOriginYLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 100),
            firstOriginYLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 100),
            
            firstOriginXSlider.topAnchor.constraint(equalTo: firstOriginXLabel.topAnchor, constant: 10),
            firstOriginXSlider.centerXAnchor.constraint(equalTo: firstFrameXLabel.centerXAnchor),
            firstOriginXSlider.widthAnchor.constraint(equalTo: firstOriginXLabel.widthAnchor),
            
            firstOriginYSlider.topAnchor.constraint(equalTo: firstOriginYLabel.topAnchor, constant: 10),
            firstOriginYSlider.centerXAnchor.constraint(equalTo: firstFrameYLabel.centerXAnchor),
            firstOriginYSlider.widthAnchor.constraint(equalTo: firstOriginYLabel.widthAnchor),
            
            secondFrameXLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 150),
            secondFrameXLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -100),
            
            secondFrameYLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 150),
            secondFrameYLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 100),
            
            secondFrameXSlider.topAnchor.constraint(equalTo: secondFrameXLabel.topAnchor, constant: 10),
            secondFrameXSlider.centerXAnchor.constraint(equalTo: firstFrameXLabel.centerXAnchor),
            secondFrameXSlider.widthAnchor.constraint(equalTo: firstFrameXLabel.widthAnchor),
            
            secondFrameYSlider.topAnchor.constraint(equalTo: secondFrameYLabel.topAnchor, constant: 10),
            secondFrameYSlider.centerXAnchor.constraint(equalTo: firstFrameYLabel.centerXAnchor),
            secondFrameYSlider.widthAnchor.constraint(equalTo: firstFrameYLabel.widthAnchor),
            
            secondOriginXLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 200),
            secondOriginXLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -100),
            
            secondOriginYLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 200),
            secondOriginYLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 100),
            
            secondOriginXSlider.topAnchor.constraint(equalTo: secondOriginXLabel.topAnchor, constant: 10),
            secondOriginXSlider.centerXAnchor.constraint(equalTo: firstFrameXLabel.centerXAnchor),
            secondOriginXSlider.widthAnchor.constraint(equalTo: firstOriginXLabel.widthAnchor),
            
            secondOriginYSlider.topAnchor.constraint(equalTo: secondOriginYLabel.topAnchor, constant: 10),
            secondOriginYSlider.centerXAnchor.constraint(equalTo: secondFrameYLabel.centerXAnchor),
            secondOriginYSlider.widthAnchor.constraint(equalTo: firstOriginYLabel.widthAnchor),
        ])
    }
    
    // MARK: Functions
    
    private func makeView(_ selectedView: SelectedView) -> UIView {
        let view = UIView()
        view.backgroundColor = selectedView.color
        
        return view
    }
    
    private func makeSlider(_ selectedView: SelectedView) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = -100
        slider.maximumValue = 100
        slider.value = 0
        slider.tintColor = selectedView.color
        
        return slider
    }
    
    private func makeLable(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 15, weight: .bold)
        
        return label
    }
    
}
