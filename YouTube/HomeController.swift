//
//  ViewController.swift
//  YouTube
//
//  Created by Effrafax Bulwer on 8/13/21.
//  Copyright © 2021 Effrafax Bulwer. All rights reserved.
//

import UIKit

final class HomeController: UICollectionViewController {

    private enum Constants {
        static let cellId = "cellId"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        collectionView.backgroundColor = .white
        
        // Регаем ячейку
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: Constants.cellId)
    }
}

// MARK: CollectionView Methods

extension HomeController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellId, for: indexPath)
        
        return cell
    }
}

// MARK: CollectionView Delegate FlowLayout

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    // Задаем размер ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: VideoCell

final class VideoCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .purple
        return label
    }()
    
//    private let subtitleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor =
//        return label
//    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        
        // Constraints for thumbnailImageView
        NSLayoutConstraint.activate([
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            thumbnailImageView.bottomAnchor.constraint(equalTo: userProfileImageView.topAnchor, constant: -8)
        ])
        
        // Constraints for userProfileImageView
        NSLayoutConstraint.activate([
            userProfileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 44),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 44),
            userProfileImageView.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -8)
        ])
        
        // Constraints for titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8)
        ])
        
        // Constraints for SeparatorView
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.topAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
