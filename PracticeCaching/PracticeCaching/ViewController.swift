//
//  ViewController.swift
//  PracticeCaching
//
//  Created by 권오준 on 2024-03-26.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: UI
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width / 2 - 50
        flowLayout.itemSize = CGSize(width: width, height: width)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout)
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "제목을 입력하세요."
        searchBar.delegate = self
        
        return searchBar
    }()
    
    // MARK: Properties
    
    private var movies: [Movie] = []
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureUI()
        configureLayout()
    }
    
    // MARK: Functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func configureUI() {
        [collectionView, searchBar].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func fetchMovies(_ text: String) {
        DispatchQueue.global().async {
            API.searchMovies(text) { [weak self] movies in
                self?.movies = movies
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }
    
}

// MARK: - CollectionView

extension ViewController : UICollectionViewDelegate,
                           UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int)
    -> Int {
        return movies.count
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
        
        let imageURL = URL(string: movies[indexPath.item].thumbnailPath)
        ImageCache.shared.loadImage(imageURL, .onlyDisk) { image in
            DispatchQueue.main.async {
                cell.updateImageView(img: image)
            }
        }
        
        return cell
    }
    
}

// MARK: - SearchBar

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        if let text = searchBar.text,
           text.isEmpty == false {
            fetchMovies(text)
        }
    }
    
}
