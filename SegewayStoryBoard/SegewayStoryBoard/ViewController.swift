//
//  ViewController.swift
//  SegewayStoryBoard
//
//  Created by SubaruShiozaki on 2019-04-25.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var passString: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func goToSecondScreen(_ sender: UIButton) {
        let sVC = SubViewController()
        navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: false)
    }
    
}

