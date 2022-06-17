//
//  ViewController.swift
//  Navigation
//
//  Created by Tatiana Volova on 18.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
  //  let post = Post(title: "Post")
    
    let firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click here", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()
    
    let secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click here", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()
    
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAppearance()
        setUpStackView()
    }
    
    private func setUpStackView() {
        view.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            buttonsStackView.widthAnchor.constraint(equalToConstant: 300),
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        buttonsStackView.addArrangedSubview(firstButton)
        buttonsStackView.addArrangedSubview(secondButton)
    }
    
    private func setUpAppearance() {
        title = "Feed"
        view.backgroundColor = .green
    }
    
    @objc func tap() {
//        let postViewController = PostViewController(post: post)
//        navigationController?.pushViewController(postViewController, animated: true)
    }
}
