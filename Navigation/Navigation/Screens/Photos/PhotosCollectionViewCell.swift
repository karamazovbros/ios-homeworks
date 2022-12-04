//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Tatiana Volova on 17.03.2022.
//  Copyright © 2022 Tania. All rights reserved.
//

import Foundation
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotosCell"
    
//    func configure(with model: Photo) {
//        let photoView = UIImageView(frame: bounds)
//        photoView.contentMode = .scaleAspectFill
//        photoView.layer.cornerRadius = 6
//        photoView.toAutoLayout()
//        photoView.clipsToBounds = true
//        photoView.image = UIImage(named: model.title)
//        contentView.addSubview(photoView)
//    }
    
    func configureImage(image: UIImage) {
        let photoView = UIImageView(frame: bounds)
        photoView.contentMode = .scaleAspectFill
        photoView.layer.cornerRadius = 6
        photoView.toAutoLayout()
        photoView.clipsToBounds = true
        photoView.image = image
        contentView.addSubview(photoView)
    }
}

