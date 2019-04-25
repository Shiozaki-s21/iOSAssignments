//
//  CityViewController.swift
//  Assignment4
//
//  Created by SubaruShiozaki on 2019-04-24.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {

    let goDetailsButt: UIButton = {
        let butt = UIButton(type: .system)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.setTitle("Go detail", for: .normal)
        butt.layer.cornerRadius = 10.0
        butt.addTarget(self, action: #selector(showDetailVC), for: .touchUpInside)
        return butt
    }()
    
    @objc private func showDetailVC() {
        let detailVC = DetailViewController()
        detailVC.city = city
        detailVC.view.backgroundColor = .cyan
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // UILabel -> CityName
    // UIButton -> Details
    var city:City! {
        didSet{
            tabBarItem = UITabBarItem(title: city.name, image: UIImage(named: city.icon), selectedImage: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = city.name
        view.addSubview(goDetailsButt)
        
        NSLayoutConstraint.activate([
            goDetailsButt.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor)
            
            ])
    }

}
