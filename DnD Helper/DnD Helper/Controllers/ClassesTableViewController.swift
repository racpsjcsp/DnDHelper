//
//  ClassesTableViewController.swift
//  DnD Helper
//
//  Created by Rafael Plinio on 27/06/21.
//

import Foundation
import UIKit

class ClassesTableViewController: UITableViewController {
    
    private var classList = [CharClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ClassesTableViewController didLoad")
        setupUI()
        getClasses()
    }
    
    private func setupUI() {
        title = "Classes"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getClasses() {
        let baseURL = "https://www.dnd5eapi.co/api"
        let finalURL = "\(baseURL)/classes"
        
        var request = URLRequest(url: URL(string: finalURL)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is (httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            if let className = try? JSONDecoder().decode(ClassList.self, from: data) {
                self.classList = className.results

//                print(self.classList)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClassMenuCell", for: indexPath) as? CharClassCell else {
            fatalError("CharClassCell not found")
        }

        let charClass = classList[indexPath.row]
        cell.titleLabel.text = charClass.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
