//
//  ViewController.swift
//  FrameVSBounds
//
//  Created by 권오준 on 2024-04-01.
//

import UIKit

#Preview {
    ViewController()
}

class ViewController: UIViewController {
    
    // MARK: UI

    private lazy var firstView = makeView(.firstView)
    private lazy var secondView = makeView(.secondView)
    
    private lazy var firstTapGesture = makeTapGesture()
    private lazy var secondTapGesture = makeTapGesture()
    
    private lazy var rotateCWButton = makeButton(isClockWise: true)
    private lazy var rotateCCWButton = makeButton(isClockWise: false)
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        
        return button
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "view"
        label.font = .systemFont(ofSize: 50, weight: .bold)
        
        return label
    }()
    
    // MARK: Properties
    
    private var selectedView: SelectedView = .firstView
    private var firstViewAngle: CGFloat = 0
    private var secondViewAngle: CGFloat = 0

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "rootView"
        
        configureUI()
        configureLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        [view, firstView, secondView].forEach {
            displayInfoOfView($0)
        }
    }
    
    // MARK: - Configure
    
    private func configureUI() {
        [
            firstView,
            secondView,
            rotateCCWButton,
            rotateCWButton,
            nextButton,
            label
        ].forEach {
            addUI(superView: view, subView: $0)
        }
        addUI(superView: firstView, subView: secondView)
        
        firstView.addGestureRecognizer(firstTapGesture)
        secondView.addGestureRecognizer(secondTapGesture)
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            firstView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            firstView.widthAnchor.constraint(equalToConstant: 300),
            firstView.heightAnchor.constraint(equalToConstant: 300),
            
            secondView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 20),
            secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 20),
            secondView.widthAnchor.constraint(equalToConstant: 200),
            secondView.heightAnchor.constraint(equalToConstant: 200),
            
            rotateCWButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 100),
            rotateCWButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 70),
            
            rotateCCWButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 100),
            rotateCCWButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -70),
            
            nextButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15),
            nextButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            
            label.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    // MARK: Functions
    
    private func addUI(superView: UIView, subView: UIView) {
        superView.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func makeView(_ selectedView: SelectedView) -> UIView {
        let view = UIView()
        view.accessibilityIdentifier = selectedView.text
        view.backgroundColor = selectedView.color
        
        return view
    }
    
    private func makeTapGesture() -> UITapGestureRecognizer {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(tapView(_:)))
        
        return gesture
    }
    
    private func makeButton(isClockWise: Bool) -> UIButton {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 50)
        let image = UIImage(systemName: isClockWise ? "arrow.clockwise" : "arrow.counterclockwise")?
            .withConfiguration(imageConfig)
        
        button.setImage(image, for: .normal)
        button.configuration = UIButton.Configuration.filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .gray
        button.configuration?.baseForegroundColor = .white
        
        button.addTarget(
            self,
            action: #selector(rotateView(_:)),
            for: .touchUpInside
        )
        
        button.tag = isClockWise ? 1 : 2
        
        return button
    }
    
    private func displayInfoOfView(_ sender: UIView) {
        let fOrigin = sender.frame.origin
        let fSize = sender.frame.size
        let bOrigin = sender.bounds.origin
        let bSize = sender.bounds.size
        
        print("_______\(sender.accessibilityIdentifier!)_______")
        print("frame -> (x: \(convert(fOrigin.x)), y: \(convert(fOrigin.y)), width: \(convert(fSize.width)), height: \(convert(fSize.height)))")
        print("bounds -> (x: \(convert(bOrigin.x)), y: \(convert(bOrigin.y)), width: \(convert(bSize.width)), height: \(convert(bSize.height)))")
    }
    
    private func convert(_ n: CGFloat) -> String {
        return String(format: "%.1f", n)
    }
    
    // MARK: Actions
    
    @objc private func tapView(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view else { return }
        
        selectedView = tappedView == firstView ? .firstView : .secondView
        label.text = selectedView.text
    }
    
    @objc private func rotateView(_ sender: UIButton) {
        let willRotateView = selectedView == .firstView ? firstView : secondView
        var angle = selectedView == .firstView ? firstViewAngle : secondViewAngle
        
        angle += sender.tag == 1 ? .pi / 4 : -.pi / 4
        
        UIView.animate(withDuration: 0.5, animations: {
            willRotateView.transform = CGAffineTransform(rotationAngle: angle)
        }) { [weak self] _ in
            guard let self = self else { return }
            
            if self.selectedView == .firstView {
                self.firstViewAngle = angle
            } else {
                self.secondViewAngle = angle
            }
            
            willRotateView.center.x = round(willRotateView.center.x * 10) / 10
            willRotateView.center.y = round(willRotateView.center.y * 10) / 10
            
            print("\(self.selectedView.text) has been rotated.")
            self.displayInfoOfView(self.firstView)
            self.displayInfoOfView(self.secondView)
        }
    }
    
    @objc private func moveToSecondVC() {
        
    }
    
}
