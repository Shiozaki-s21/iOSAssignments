//
//  ViewController.swift
//  Assignment8
//
//  Created by SubaruShiozaki on 2019-05-07.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let reuseIdentifier = "repo"
    var repos: [Repo] = [Repo]()
    fileprivate let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.refreshControl = refreshController
        refreshController.addTarget(self, action: #selector(refreshRepos), for: .valueChanged)
        
        //        tableView.register(UITableView.self, forCellReuseIdentifier: reuseIdentifier)
        getRepogitory(userName: "Shiozaki-s21")
    }
    
    @objc func refreshRepos() {
        getRepogitory(userName: "Shiozaki-s21")
    }
    
    
    private func getRepogitory(userName:String) {
        navigationItem.title = userName
        guard let url = URL(string: "https://api.github.com/users/\(userName)/repos") else {return}
        
        let task = URLSession(configuration: .default).dataTask(with: url) {(data, res, err) in
            
            if let err = err {
                print("Error", err)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let repos:[Repo] = try decoder.decode([Repo].self, from: data)
                    self.repos = repos
                    // update ui main thread
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.refreshController.endRefreshing()
                    }
                } catch {
                    debugPrint("Error", error)
                }
                //            let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any]
            }
        }
        task.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
                return UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
            }
            return cell
        }()
        
        cell.textLabel?.text = repos[indexPath.row].name
        cell.detailTextLabel?.text = repos[indexPath.row].created_at.description
        return cell
    }
    
    
}

