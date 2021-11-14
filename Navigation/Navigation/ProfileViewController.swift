//
//  SecondViewController.swift
//  Navigation
//
//  Created by Tatiana Volova on 18.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
   
    let profileHeaderView = ProfileHeaderView()
    
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
        addAvatar()
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
    }
    
    func addAvatar() {
        view.addSubview(avatar)
        avatar.frame = CGRect(x: 16, y: 120, width: 110, height: 110)
        avatar.layer.cornerRadius = avatar.frame.height/2
        
    }
}
