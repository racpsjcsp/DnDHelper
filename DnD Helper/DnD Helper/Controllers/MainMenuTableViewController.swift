//
//  MainMenuTableViewController.swift
//  DnD Helper
//
//  Created by Rafael Plinio on 27/06/21.
//

import UIKit

class MainMenuTableViewController: UITableViewController {
    
    private let menuList = ["Classes", "Features", "Monsters", "Spells"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MeinMenuTableViewController didLoad")
        setupUI()
    }
    
    private func setupUI() {
        title = "D&D Helper Menu"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuCell", for: indexPath) as? MainMenuCell else {
            fatalError("MainMenuCell not found")
        }

        for _ in menuList {
            cell.titleLabel.text = menuList[indexPath.row]
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}

