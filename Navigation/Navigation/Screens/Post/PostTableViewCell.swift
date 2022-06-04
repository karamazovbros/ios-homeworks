//
//  PostTebleViewCell.swift
//  Navigation
//
//  Created by Tatiana Volova on 05.03.2022.
//  Copyright © 2022 Tania. All rights reserved.
//

import UIKit
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    static let reuseId = "PostTableCell"
    
    let randomInt = Int.random(in: 1...8)
    let filter: ColorFilter?
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        label.toAutoLayout()
        return label
    }()
    
    private var postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        imageView.toAutoLayout()
        return imageView
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.toAutoLayout()
        return label
    }()
    
    private var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    private var viewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.toAutoLayout()
        return label
    }()
    
    // MARK: - Int
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        configureUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    switch randomInt {
    case 1: filter = .posterize
    case 2: filter = .colorInvert
    case 3: filter = .transfer
    case 4: filter = .noir
    case 5: filter = .tonal
    case 6: filter = .process
    case 7: filter = .chrome
    case 8: filter = .fade
    default: filter = nil
    }
    
    let processor = ImageProcessor()
    guard let filter = filter else { return }
    guard let image = postImage.image else { return }
    
    processor.processImage(sourceImage: image, filter: filter) { filteredImage in
        postImage.image = filteredImage
    }
    
    // MARK: - Interface
    func configure(with model: Post) {
        titleLabel.text = model.author
        postImage.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        likesLabel.text = "likes: \(model.likes)"
        viewsLabel.text = "views: \(model.views)"
    }
    
    private func configureUI() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(postImage)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),

            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.trailingAnchor.constraint(equalTo: viewsLabel.leadingAnchor, constant: -10),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3)
        ])
    }
}
