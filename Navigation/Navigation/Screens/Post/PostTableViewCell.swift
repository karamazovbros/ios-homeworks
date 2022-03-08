//
//  PostTebleViewCell.swift
//  Navigation
//
//  Created by Tatiana Volova on 05.03.2022.
//  Copyright © 2022 Tania. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
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
    
    // MARK: - Interface
    func configure(with model: Post) {
        titleLabel.text = model.author
        postImage.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        likesLabel.text = "likes: \(model.likes)"
        viewsLabel.text = "views: \(model.views)"
    }
    
    private func configureUI() {
        
        addSubview(titleLabel)
        addSubview(postImage)
        addSubview(descriptionLabel)
        addSubview(likesLabel)
        addSubview(viewsLabel)
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            postImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            postImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),

            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 60),

            likesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            likesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            likesLabel.heightAnchor.constraint(equalToConstant: 60),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            viewsLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
