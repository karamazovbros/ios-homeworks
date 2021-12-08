//
//  SecondViewController.swift
//  Navigation
//
//  Created by Tatiana Volova on 18.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
<<<<<<< Updated upstream
        addAvatar()
        setUpButtonStatus()
        setUpUsernameLabel()
        setUpStatusTextField()
=======
>>>>>>> Stashed changes
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
    }
<<<<<<< Updated upstream
    
    func addAvatar() {
        view.addSubview(avatar)
        avatar.frame = CGRect(x: 16, y: 110, width: 110, height: 110)
        avatar.layer.cornerRadius = avatar.frame.height/2
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
        view.addSubview(buttonStatus)
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
        view.addSubview(usernameLabel)
    }
    
    func setUpStatusTextField() {
        statusTextField.text = nil
        statusTextField.placeholder = "Waiting for something..."
        statusTextField.textColor = .gray
        statusTextField.center = CGPoint(x: 270, y: 190)
        statusTextField.sizeToFit()
        view.addSubview(statusTextField)
    }
=======
>>>>>>> Stashed changes
}
   
