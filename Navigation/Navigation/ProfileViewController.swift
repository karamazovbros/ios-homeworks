//
//  SecondViewController.swift
//  Navigation
//
//  Created by Tatiana Volova on 18.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
   
    let profileHeaderView = ProfileHeaderView()
    let buttonStatus = UIButton()
    let usernameLabel = UILabel(frame: CGRect(x: 10, y: 50, width: 230, height: 21))
    let statusTextField =  UITextField(frame: CGRect(x: 10, y: 50, width: 230, height: 21))
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        view.addSubview(avatar)
        view.addSubview(buttonStatus)
        view.addSubview(usernameLabel)
        view.addSubview(statusTextField)
        view.addSubview(profileHeaderView)
        addAvatar()
        setUpButtonStatus()
        setUpUsernameLabel()
        setUpStatusTextField()
        addProfileHeaderView()
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
    }
    
    func addAvatar() {
        avatar.frame = CGRect(x: 16, y: 110, width: 110, height: 110)
        avatar.layer.cornerRadius = avatar.frame.height/2
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            avatar.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            avatar.widthAnchor.constraint(equalToConstant: 100),
            avatar.heightAnchor.constraint(equalTo: avatar.widthAnchor)
        ])
    }
    
    func setUpButtonStatus() {
        buttonStatus.setTitle("Show status", for: .normal)
        buttonStatus.backgroundColor = .systemBlue
        buttonStatus.frame = CGRect(x: 16, y: 237, width: 380, height: 50)
        buttonStatus.layer.cornerRadius = 14
        buttonStatus.layer.shadowColor = UIColor.black.cgColor
        buttonStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonStatus.layer.shadowOpacity = 0.7
        buttonStatus.layer.shadowRadius = 4.0
        buttonStatus.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        buttonStatus.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStatus.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            buttonStatus.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            buttonStatus.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 20),
            buttonStatus.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func buttonClicked() {
        print(statusTextField.text ?? "")
    }
    
    func setUpUsernameLabel() {
        usernameLabel.text = "Hipster Cat"
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 27.0)
        usernameLabel.textColor = .black
        usernameLabel.center = CGPoint(x: 270, y: 130)
        usernameLabel.sizeToFit()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 20),
            usernameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
        ])
    }
    
    func setUpStatusTextField() {
        statusTextField.text = nil
        statusTextField.placeholder = "Waiting for something..."
        statusTextField.textColor = .gray
        statusTextField.center = CGPoint(x: 270, y: 190)
        statusTextField.sizeToFit()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            statusTextField.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 20),
            statusTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            statusTextField.heightAnchor.constraint(equalToConstant: 20),
        ])
    }

    func addProfileHeaderView() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 220).isActive = true
        profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }

}
