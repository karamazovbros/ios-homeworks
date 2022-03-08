//
//  SecondViewController.swift
//  Navigation
//
//  Created by Tatiana Volova on 18.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    private let profileHeaderViewHeight: CGFloat = 220
    private var posts = [Post]()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .lightGray
        addHeader()
        populatePosts()
        configureUI()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // MARK: - Private
    private func addHeader() {
        view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: profileHeaderViewHeight)
        ])
    }
    
    private func populatePosts() {
        posts.append(.init(author: "Frodo",
                           description: "Ring bearer. Frodo Baggins was a hobbit of the Third Age, the most famous of all Hobbits in the histories for his leading role in the Quest of the Ring. During this epic quest, he bore the One Ring to Mount Doom and there destroyed it, giving him renown like no other Halfling throughout Middle-earth.",
                           image: "Frodo",
                           likes: 137,
                           views: 600))
        posts.append(.init(author: "Aragorn",
                           description: "The Defender. Aragorn was the son of Arathorn II and Gilraen. He was the last Chieftain of the Dúnedain and a direct descendant through many[note 1] generations of Isildur, the last High King of both Arnor and Gondor. Aragorn would become the greatest Man of his time, leading the Men of the West against Sauron's forces, helping to destroy the One Ring, and reuniting the Kingdoms of Arnor and Gondor.",
                           image: "Aragorn",
                           likes: 1125,
                           views: 4500))
        posts.append(.init(author: "Galadriel",
                           description: "The Elf Queen. The mightiest and fairest of all the Elves that remained in Middle-earth. During the War of the Ring, she revealed to Frodo Baggins that she was the bearer of Nenya. After the War, she returned to Valinor.",
                           image: "Galadriel",
                           likes: 750,
                           views: 3300))
        posts.append(.init(author: "Legolas",
                           description: "The Elf Fighter. Legolas was counted unusual for his strong friendship with a Dwarf, Gimli son of Glóin. Such a friendship was rare between the two races, on account of the long-standing grievances between Dwarves and Elves dating back to the Elder Days.",
                           image: "Legolas",
                           likes: 1329,
                           views: 4312))
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),            
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.configure(with:post)
        return cell
    }
    
    private func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> CGFloat {
        return 400.0
    }
}
