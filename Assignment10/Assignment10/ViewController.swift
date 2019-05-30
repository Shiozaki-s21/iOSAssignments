//
//  ViewController.swift
//  Assignment10
//
//  Created by SubaruShiozaki on 2019-05-13.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bluetoothSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        
        if defaults.object(forKey: "switch") != nil {
            bluetoothSwitch.isOn = defaults.bool(forKey: "switch")
        }
    }
    
    @IBAction func saveSwitchState(_ sender: UISwitch) {
        let defaults = UserDefaults.standard
        
        if sender.isOn {
            defaults.set(true, forKey: "switch")
        } else {
            defaults.set(false, forKey: "switch")
        }
        
    }
    


}

