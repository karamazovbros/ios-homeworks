//
//  ViewController.swift
//  Navigation
//
//  Created by Tatiana Volova on 18.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    let button = UIButton()
    let post = Post(title: "Post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        setUpAppearance()
    }
    
    func setUpAppearance() {
        title = "Feed"
        view.backgroundColor = .green
    }
    
    func setUpButton() {
        button.backgroundColor = .darkGray
        button.frame = CGRect(x: 50, y: 210, width: 210, height: 45)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func tap() {
        let postViewController = PostViewController(post: post)
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
}
