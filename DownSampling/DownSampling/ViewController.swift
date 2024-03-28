//
//  ViewController.swift
//  DownSampling
//
//  Created by 권오준 on 2024-03-27.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:  UI
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width / 2 - 40
        size = CGSize(width: width, height: width)
        flowLayout.itemSize = size!
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var clearButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(didTapClearButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var originalButton = CustomButton(fetchOption: .original)
    
    private lazy var downsampleButton1 = CustomButton(fetchOption: .uiRenderer)
    
    private lazy var downsampleButton2 = CustomButton(fetchOption: .imageIO)
    
    // MARK: Properties
    
    private let downsampler = DownSampler()
    private var size: CGSize?
    private var fetchOption: FetchOptions = .original
    private var isClear: Bool = true
    
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
        
        [collectionView, clearButton, stackView]
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
            collectionView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            clearButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            clearButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            clearButton.widthAnchor.constraint(equalToConstant: 30),
            clearButton.heightAnchor.constraint(equalToConstant: 30),
            
            stackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
        ])
    }
    
    // MARK:  Functions
    
    @objc private func fetchImage(_ sender: CustomButton) {
        isClear = false
        fetchOption = sender.getFetchOption()
        print("FetchOption has been changed to \(fetchOption).")
        collectionView.reloadData()
    }
    
    @objc private func didTapClearButton(_ sender: UIButton) {
        isClear = true
        print("CollectionView has been cleared.")
        collectionView.reloadData()
    }
    
}

// MARK: - CollectionView

extension ViewController: UICollectionViewDelegate,
                          UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int)
    -> Int {
        return 20
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Cell.id,
            for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }

        if isClear {
            cell.updateImageView(image: nil)
        } else {
            downsampler.fetchImage(size!, fetchOption) { image in
                DispatchQueue.main.async {
                    cell.updateImageView(image: image)
                }
            }
        }
        
        return cell
    }
    
}
