//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Tatiana Volova on 17.03.2022.
//  Copyright © 2022 Tania. All rights reserved.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    let facade = ImagePublisherFacade()
    
    var photos = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(photosCollection)
        photosCollection.dataSource = self
        photosCollection.delegate = self
        setupConstraints()
        populatePhotos()
        navigationController?.navigationBar.isHidden = false
        self.title = "Photo Gallery"
        
        subscribeToImages()
        loadImages()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        unsubscribeFromImages()
    }
    
    private func subscribeToImages() {
        facade.subscribe(self)
    }
    
    
    private func loadImages() {
        let userPhotos = Photos.pics.compactMap { $0 }
        facade.addImagesWithTimer(time: 0.1, repeat: 20, userImages: userPhotos)
    }
    
    private func populatePhotos() {
        //        photos = Photos.photosNames.map { Photo(title: $0) }
    }
    
    private func unsubscribeFromImages() {
        print("ОТПИСКА")
        facade.removeSubscription(for: self)
        facade.rechargeImageLibrary()
    }
    
    
    private lazy var photosCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.scrollDirection = .vertical
        
        let photosCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photosCollection.toAutoLayout()
        photosCollection.backgroundColor = .white
        photosCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return photosCollection
    }()
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photosCollection.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        //        let photo = photos[indexPath.row]
        //        cell.configure(with: photo)
        cell.configureImage(image: photos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 3
        let paddindWidth = 8 * (itemsPerRow + 1)
        let accessibleWidth = collectionView.frame.width - paddindWidth
        let widthPerItem = accessibleWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
}

extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        photos = images
        photosCollection.reloadData()
        
    }
    
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photosCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photosCollection.topAnchor.constraint(equalTo: view.topAnchor),
            photosCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photosCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
