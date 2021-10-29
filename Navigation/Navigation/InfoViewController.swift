//
//  InfoViewController.swift
//  Navigation
//
//  Created by Tatiana Volova on 27.10.2021.
//

import UIKit

class InfoViewController: UIViewController {
    let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 0.137, green: 0.150, blue: 0.129, alpha: 1)
        setUpButton()
    }
    
    func setUpButton() {
        button.backgroundColor = .darkGray
        button.frame = CGRect(x: 50, y: 210, width: 210, height: 45)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(button)
    }
    @IBAction func tap() {
        let alert = UIAlertController(title: "Go back", message: "wtf", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in print("Cancel")}
        alert.addAction(cancelAction)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in print("Ok")}
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
