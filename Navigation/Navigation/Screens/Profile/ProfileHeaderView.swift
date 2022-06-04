//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Tatiana Volova on 05.11.2021.
//

import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
    // MARK: - Private properties
    
    private let horizontalPadding: CGFloat = 16
    private let verticalSpacing: CGFloat = 16
    private let avatarSize: CGFloat = 110
    private let statusButtonHeight: CGFloat = 50
    var defaultAvatarCenter: CGPoint = CGPoint(x: 0, y: 0)
    
    private lazy var plagView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.toAutoLayout()
        view.backgroundColor = .lightGray
        view.alpha = 0
        return view
    }()
    
    private lazy var escButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setImage(UIImage(named: "esc"), for: .normal)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapEscButton))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(gesture)
        button.alpha = 0
        button.contentMode = .scaleAspectFit
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .selected)
        return button
    }()
    
    private(set) lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapOnAvatar))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        imageView.addGestureRecognizer(gesture)
        imageView.isUserInteractionEnabled = true
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
        addSubview(escButton)
        addSubview(plagView)
        
        avatar.snp.makeConstraints { constraint in
            constraint.width.equalTo(avatarSize)
            constraint.height.equalTo(avatarSize)
            constraint.leftMargin.equalTo(horizontalPadding)
            constraint.topMargin.equalTo(verticalSpacing)
        }
        
        usernameLabel.snp.makeConstraints { constraint in
            constraint.left.equalTo(avatar.snp.right).offset(verticalSpacing)
            constraint.rightMargin.equalTo(horizontalPadding)
            constraint.top.equalTo(self.snp.top).offset(11)
        }
        
        statusTextField.snp.makeConstraints { constraint in
            constraint.left.equalTo(avatar.snp.right).offset(verticalSpacing)
            constraint.top.equalTo(usernameLabel.snp.bottom).offset(40)
            constraint.right.equalTo(horizontalPadding)
        }
        
        statusButton.snp.makeConstraints { constraint in
            constraint.left.equalTo(horizontalPadding)
            constraint.right.equalTo(horizontalPadding)
            constraint.top.equalTo(avatar.snp.bottom).offset(verticalSpacing)
            constraint.height.equalTo(statusButtonHeight)
        }
        
        plagView.snp.makeConstraints { constraint in
            constraint.left.equalTo(20)
            constraint.top.equalTo(60)
            constraint.right.equalTo(-30)
        }
        
        escButton.snp.makeConstraints { constraint in
            constraint.right.equalTo(avatar.snp.right)
            constraint.top.equalTo(avatar.snp.top)
        }
//        NSLayoutConstraint.activate([
//            avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
//            avatar.topAnchor.constraint(equalTo: topAnchor, constant: verticalSpacing),
//            avatar.widthAnchor.constraint(equalToConstant: avatarSize),
//            avatar.heightAnchor.constraint(equalToConstant: avatarSize),
            
//            usernameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: verticalSpacing),
//            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
//            usernameLabel.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 11),
            
//            statusTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 40),
//            statusTextField.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: verticalSpacing),
//            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
            
//            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
//            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
//            statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: verticalSpacing),
//            statusButton.heightAnchor.constraint(equalToConstant: statusButtonHeight),
//
//            plagView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            plagView.topAnchor.constraint(equalTo: topAnchor, constant: 60),
//            plagView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
//            escButton.trailingAnchor.constraint(equalTo: avatar.trailingAnchor),
//            escButton.topAnchor.constraint(equalTo: avatar.topAnchor)
//
//        ])
        
        avatar.layer.cornerRadius = avatarSize / 2
    }
    
    // MARK: - Gestures and Animations
    
    @objc func tapOnAvatar() {
        UIImageView.animate(withDuration: 0.5,
                            animations: {
                                self.defaultAvatarCenter = self.avatar.center
                                self.avatar.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                                self.avatar.transform = CGAffineTransform(scaleX: UIScreen.main.bounds.width / self.avatar.frame.width, y: UIScreen.main.bounds.width / self.avatar.frame.width)
                                self.avatar.layer.cornerRadius = 0
                                self.plagView.alpha = 0.9
                            },
                            completion: { _ in
                                UIImageView.animate(withDuration: 0.3) {
                                self.escButton.alpha = 1
                                }
            })
    }

    @objc func tapEscButton() {
        UIImageView.animate(withDuration: 0.3,
                            animations: {
                                self.escButton.alpha = 0
                            },
                            completion: { _ in
        UIImageView.animate(withDuration: 0.5) {
                                self.avatar.center = self.defaultAvatarCenter
                                self.avatar.transform = CGAffineTransform(scaleX: 1, y: 1)
                                self.avatar.layer.cornerRadius = self.avatar.frame.width / 2
                                self.plagView.alpha = 0
                                }
                            })
    }

}
