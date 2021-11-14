//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Tatiana Volova on 14.09.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        // подключаем ProfileView.xib
        let profileView = (Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)![0])
        self.view.addSubview(profileView as! ProfileView)
      }
}
