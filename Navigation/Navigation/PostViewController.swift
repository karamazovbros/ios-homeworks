//
//  PostViewController.swift
//  Navigation
//
//  Created by Tatiana Volova on 25.10.2021.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post
   
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = post.title
        addBarButton()
    }
 
    func addBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain , target: self, action: #selector(tap))
    }
    
    @objc func tap() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true, completion: nil)
    }
    
    
}
