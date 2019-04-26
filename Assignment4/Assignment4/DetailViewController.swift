//
//  DetailViewController.swift
//  Assignment4
//
//  Created by SubaruShiozaki on 2019-04-24.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var city: City!
    
    var nameLabel:UILabel = UILabel()
    var countryLabel:UILabel = UILabel()
    var tempLabel:UILabel = UILabel()
    var summaryLabel:UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Making labels for display
        nameLabel.text = city.name
        countryLabel.text = city.country
        tempLabel.text = String(city.temp)
        summaryLabel.text = city.summary
        
        // add labels to view as a subView
//        self.view.addSubview(nameLabel)
//        self.view.addSubview(countryLabel)
//        self.view.addSubview(tempLabel)
//        self.view.addSubview(summaryLabel)
        
        // deciding to design, constrait
//        var stackView:UIStackView = [nameLabel, countryLabel, tempLabel, summaryLabel]
        var stackView:UIStackView = .init(arrangedSubviews: [nameLabel, countryLabel, tempLabel, summaryLabel])
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
    }
}

