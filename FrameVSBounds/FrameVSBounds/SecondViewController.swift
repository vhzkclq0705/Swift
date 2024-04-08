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
    private lazy var firstBoundsXLabel = makeLable("FirstView_Bounds_X")
    private lazy var firstBoundsYLabel = makeLable("FirstView_Bounds_Y")
    
    private lazy var firstFrameXSlider = makeSlider(.firstView)
    private lazy var firstFrameYSlider = makeSlider(.firstView)
    private lazy var firstBoundsXSlider = makeSlider(.firstView)
    private lazy var firstBoundsYSlider = makeSlider(.firstView)
    
    private lazy var secondFrameXLabel = makeLable("SecondView_Frame_X")
    private lazy var secondFrameYLabel = makeLable("SecondView_Frame_Y")
    private lazy var secondBoundsXLabel = makeLable("SecondView_Bounds_X")
    private lazy var secondBoundsYLabel = makeLable("SecondView_Bounds_Y")
    
    private lazy var secondFrameXSlider = makeSlider(.secondView)
    private lazy var secondFrameYSlider = makeSlider(.secondView)
    private lazy var secondBoundsXSlider = makeSlider(.secondView)
    private lazy var secondBoundsYSlider = makeSlider(.secondView)
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.uturn.backward.circle.fill"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(resetAll(_:)), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: Properties
    
    private lazy var firstViewFrameX: CGFloat = 0
    private lazy var firstViewFrameY: CGFloat = 0
    private lazy var secondViewFrameX: CGFloat = 0
    private lazy var secondViewFrameY: CGFloat = 0
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureUI()
        configureLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        firstViewFrameX = firstView.frame.origin.x
        firstViewFrameY = firstView.frame.origin.y
        secondViewFrameX = secondView.frame.origin.x
        secondViewFrameY = secondView.frame.origin.y
    }
    
    // MARK: Configure
    
    private func configureUI() {
        [
            firstView,
            firstFrameXLabel,
            firstFrameYLabel,
            firstBoundsXLabel,
            firstBoundsYLabel,
            firstFrameXSlider,
            firstFrameYSlider,
            firstBoundsXSlider,
            firstBoundsYSlider,
            secondFrameXLabel,
            secondFrameYLabel,
            secondBoundsXLabel,
            secondBoundsYLabel,
            secondFrameXSlider,
            secondFrameYSlider,
            secondBoundsXSlider,
            secondBoundsYSlider,
            resetButton
        ].forEach {
            addUI(superView: view, subView: $0)
        }
        
        addUI(superView: firstView, subView: secondView)
        
        firstFrameXSlider.addTarget(self, action: #selector(adjustFirstViewFrameX(_:)), for: .valueChanged)
        firstFrameYSlider.addTarget(self, action: #selector(adjustFirstViewFrameY(_:)), for: .valueChanged)
        firstBoundsXSlider.addTarget(self, action: #selector(adjustFirstViewBoundsX(_:)), for: .valueChanged)
        firstBoundsYSlider.addTarget(self, action: #selector(adjustFirstViewBoundsY(_:)), for: .valueChanged)
        secondFrameXSlider.addTarget(self, action: #selector(adjustSecondViewFrameX(_:)), for: .valueChanged)
        secondFrameYSlider.addTarget(self, action: #selector(adjustSecondViewFrameY(_:)), for: .valueChanged)
        secondBoundsXSlider.addTarget(self, action: #selector(adjustSecondViewBoundsX(_:)), for: .valueChanged)
        secondBoundsYSlider.addTarget(self, action: #selector(adjustSecondViewBoundsY(_:)), for: .valueChanged)
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
            
            firstBoundsXLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 100),
            firstBoundsXLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -100),
            
            firstBoundsYLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 100),
            firstBoundsYLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 100),
            
            firstBoundsXSlider.topAnchor.constraint(equalTo: firstBoundsXLabel.topAnchor, constant: 10),
            firstBoundsXSlider.centerXAnchor.constraint(equalTo: firstFrameXLabel.centerXAnchor),
            firstBoundsXSlider.widthAnchor.constraint(equalTo: firstBoundsXLabel.widthAnchor),
            
            firstBoundsYSlider.topAnchor.constraint(equalTo: firstBoundsYLabel.topAnchor, constant: 10),
            firstBoundsYSlider.centerXAnchor.constraint(equalTo: firstFrameYLabel.centerXAnchor),
            firstBoundsYSlider.widthAnchor.constraint(equalTo: firstBoundsYLabel.widthAnchor),
            
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
            
            secondBoundsXLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 200),
            secondBoundsXLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -100),
            
            secondBoundsYLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 200),
            secondBoundsYLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 100),
            
            secondBoundsXSlider.topAnchor.constraint(equalTo: secondBoundsXLabel.topAnchor, constant: 10),
            secondBoundsXSlider.centerXAnchor.constraint(equalTo: firstFrameXLabel.centerXAnchor),
            secondBoundsXSlider.widthAnchor.constraint(equalTo: firstBoundsXLabel.widthAnchor),
            
            secondBoundsYSlider.topAnchor.constraint(equalTo: secondBoundsYLabel.topAnchor, constant: 10),
            secondBoundsYSlider.centerXAnchor.constraint(equalTo: secondFrameYLabel.centerXAnchor),
            secondBoundsYSlider.widthAnchor.constraint(equalTo: firstBoundsYLabel.widthAnchor),
            
            resetButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            resetButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
        ])
    }
    
    // MARK: Functions
    
    private func addUI(superView: UIView, subView: UIView) {
        superView.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
    }
    
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
    
    // MARK: Actions
    
    @objc private func resetAll(_ sender: UIButton) {
        firstView.frame.origin = CGPoint(x: firstViewFrameX, y: firstViewFrameY)
        firstView.bounds.origin = CGPoint(x: 0, y: 0)
        secondView.frame.origin = CGPoint(x: secondViewFrameX, y: secondViewFrameY)
        secondView.bounds.origin = CGPoint(x: 0, y: 0)
        
        [
            firstFrameXSlider,
            firstFrameYSlider,
            firstBoundsXSlider,
            firstBoundsYSlider,
            secondFrameXSlider,
            secondFrameYSlider,
            secondBoundsXSlider,
            secondBoundsYSlider
        ]
            .forEach { $0.value = 0 }
    }
    
    @objc private func adjustFirstViewFrameX(_ sender: UISlider) {
        firstView.frame.origin.x = firstViewFrameX + CGFloat(sender.value)
    }
    
    @objc private func adjustFirstViewFrameY(_ sender: UISlider) {
        firstView.frame.origin.y = firstViewFrameY + CGFloat(sender.value)
    }
    
    @objc private func adjustFirstViewBoundsX(_ sender: UISlider) {
        firstView.bounds.origin.x = CGFloat(sender.value)
    }
    
    @objc private func adjustFirstViewBoundsY(_ sender: UISlider) {
        firstView.bounds.origin.y = CGFloat(sender.value)
    }
    
    @objc private func adjustSecondViewFrameX(_ sender: UISlider) {
        secondView.frame.origin.x = secondViewFrameX + CGFloat(sender.value)
    }
    
    @objc private func adjustSecondViewFrameY(_ sender: UISlider) {
        secondView.frame.origin.y = secondViewFrameY + CGFloat(sender.value)
    }
    
    @objc private func adjustSecondViewBoundsX(_ sender: UISlider) {
        secondView.bounds.origin.x = CGFloat(sender.value)
    }
    
    @objc private func adjustSecondViewBoundsY(_ sender: UISlider) {
        secondView.bounds.origin.y = CGFloat(sender.value)
    }
    
}
