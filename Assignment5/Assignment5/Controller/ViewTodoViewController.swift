//
//  ViewTodoViewController.swift
//  Assignment5
//
//  Created by SubaruShiozaki on 2019-05-03.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

class ViewTodoViewController: UIViewController {
    // String for titile
    var todoTitle:String = ""
    //String for description
    var todoDescription:String = ""
    
    // label for description
    let todoDescriptionLabel:UITextView = {
        let lb = UITextView()
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // set Todo titile to navigationar title
        navigationItem.title = todoTitle
        todoDescriptionLabel.text = todoDescription
        
        view.addSubview(todoDescriptionLabel)
        todoDescriptionLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        todoDescriptionLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        todoDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        todoDescriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
//    init(todoTitle:String , todoDescription:String) {
//        super.init(nibName: nil, bundle: nil)
//        self.todoTitle = todoTitle
//        self.todoDescription = todoDescription
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
