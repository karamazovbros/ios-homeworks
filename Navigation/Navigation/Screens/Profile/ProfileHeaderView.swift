//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Tatiana Volova on 05.11.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - Private properties
    
    private let horizontalPadding: CGFloat = 16
    private let verticalSpacing: CGFloat = 16
    private let avatarSize: CGFloat = 110
    private let statusButtonHeight: CGFloat = 50
    
    private(set) lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        return imageView
    }()
    
    private(set) lazy var statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 14
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.toAutoLayout()
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var usernameLabel: UILabel = {
        let username = UILabel()
        username.text = "Hipster Cat"
        username.font = UIFont.boldSystemFont(ofSize: 18)
        username.toAutoLayout()
        return username
    }()
    
    private(set) lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Waiting for something..."
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.toAutoLayout()
        return textField
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal methods
    
    @objc func buttonClicked() {
        print(statusTextField.text ?? "")
    }
    
    // MARK: - Private methods
    
    private func createSubviews() {
        addSubview(avatar)
        addSubview(statusButton)
        addSubview(statusTextField)
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
            avatar.topAnchor.constraint(equalTo: topAnchor, constant: verticalSpacing),
            avatar.widthAnchor.constraint(equalToConstant: avatarSize),
            avatar.heightAnchor.constraint(equalToConstant: avatarSize),
            
            usernameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: verticalSpacing),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
            usernameLabel.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 11),
            
            statusTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: verticalSpacing),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
            
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
            statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: verticalSpacing),
            statusButton.heightAnchor.constraint(equalToConstant: statusButtonHeight)
        ])
        
        avatar.layer.cornerRadius = avatarSize / 2
    }
}
