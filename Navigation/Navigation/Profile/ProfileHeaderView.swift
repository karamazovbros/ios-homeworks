//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Tatiana Volova on 05.11.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private(set) lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private(set) lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.image = UIImage(named: "cat1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    func addAvatar() {
        avatar.frame = CGRect(x: 16, y: 110, width: 110, height: 110)
        avatar.layer.cornerRadius = avatar.frame.height/2
        
    }
    
    private(set) lazy var buttonStatus: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.frame = CGRect(x: 16, y: 237, width: 380, height: 50)
        button.layer.cornerRadius = 14
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        return button
    }()
    
    func addButton(){
        buttonStatus.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        print(statusTextField.text ?? "")
    }
    
    private(set) lazy var usernameLabel: UILabel = {
        let username = UILabel()
        username.text = "Hipster Cat"
        username.font = UIFont.boldSystemFont(ofSize: 27.0)
        username.textColor = .black
        username.center = CGPoint(x: 150, y: 130)
        username.sizeToFit()
       return username
    }()
    
    private(set) lazy var statusTextField: UITextField = {
        let statusTF = UITextField()
        statusTF.text = nil
        statusTF.placeholder = "Waiting for something..."
        statusTF.textColor = .gray
        statusTF.center = CGPoint(x: 150, y: 190)
        statusTF.sizeToFit()
        return statusTF
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            createSubviews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func createSubviews() {
            addButton()
            addAvatar()
            addSubview(avatar)
            addSubview(buttonStatus)
            addSubview(statusTextField)
            addSubview(usernameLabel)
    }
}

