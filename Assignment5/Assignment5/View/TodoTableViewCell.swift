//
//  TodoTableViewCell.swift
//  Assignment5
//
//  Created by SubaruShiozaki on 2019-05-02.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    let todoName:UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.boldSystemFont(ofSize: 12)
        lb.textColor = .blue
        return lb
    }()
    
    let todoDescription:UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
//        lb.isHidden = true
        lb.isEnabled = false
        return lb
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        let cellStack:UIStackView = UIStackView(arrangedSubviews: [todoName, todoDescription])
        addSubview(todoName)
        todoName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        todoName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
