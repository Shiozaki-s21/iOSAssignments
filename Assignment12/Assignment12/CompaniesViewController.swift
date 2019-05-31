//
//  ViewController.swift
//  Assignment12
//
//  Created by SubaruShiozaki on 2019-05-14.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .spaceGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Companies"
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    


}

