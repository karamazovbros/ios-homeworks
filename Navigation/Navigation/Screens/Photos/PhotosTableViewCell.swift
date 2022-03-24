//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Tatiana Volova on 17.03.2022.
//  Copyright © 2022 Tania. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
        
    static let reuseId = "PhotosTableCell"
    
    private lazy var photosLabel: UILabel = {
        let photo = UILabel()
        photo.text = "Photos"
        photo.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photo.textColor = .black
        photo.toAutoLayout()
        return photo
    }()
    
   static var arrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .black
        button.toAutoLayout()
        return button
    }()
    
    private var collectionView: UICollectionView!
   
    private var photos = [Photo]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initCollectionView()
        populatePhotos()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func populatePhotos() {
        photos.append(.init(title: "IMG0"))
        photos.append(.init(title: "IMG1"))
        photos.append(.init(title: "IMG2"))
        photos.append(.init(title: "IMG3"))
        photos.append(.init(title: "IMG4"))
        photos.append(.init(title: "IMG5"))
        photos.append(.init(title: "IMG6"))
        photos.append(.init(title: "IMG7"))
        photos.append(.init(title: "IMG8"))
        photos.append(.init(title: "IMG9"))
        photos.append(.init(title: "IMG10"))
        photos.append(.init(title: "IMG11"))
        photos.append(.init(title: "IMG12"))
        photos.append(.init(title: "IMG13"))
        photos.append(.init(title: "IMG14"))
        photos.append(.init(title: "IMG15"))
    }
    
    private func initCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100.0, height: 80.0)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .white
        collectionView.toAutoLayout()
    }

private func configureUI() {
    
    contentView.addSubview(photosLabel)
    contentView.addSubview(PhotosTableViewCell.arrowButton)
    contentView.addSubview(collectionView)
    
    NSLayoutConstraint.activate([
        photosLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
        photosLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
        photosLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

        PhotosTableViewCell.arrowButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
        PhotosTableViewCell.arrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),

        collectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    }
}

extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        let photo = photos[indexPath.row]
        cell.configure(with: photo)
        return cell
    }
}

