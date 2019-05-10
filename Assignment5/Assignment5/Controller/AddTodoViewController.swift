//
//  AddTodoViewController.swift
//  Assignment5
//
//  Created by SubaruShiozaki on 2019-05-02.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

protocol AddTodoViewControllerDelegate {
    func addTodoDidFinish(_ todo:TodoModel)
    func addTodoDidCancel()
}

class AddTodoViewController: UIViewController {

    var delegate:AddTodoViewControllerDelegate?
    
    // label
    let descriptionLable: UILabel = {
        let lb:UILabel = UILabel(title: "Todo:", fontSize: 20, bold: true, color: UIColor.black)
        return lb
    }()
    
    // textfield for Title
    let
    todoTextField: UITextField = {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "What will you do?"
        
        return tf
    }()
    
    // textField for description
    let todoDescription: UITextField = {
       let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Todo Description"
        
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        navigationItem.title = "Add Todo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didAddTodo))
    }
    
    @objc fileprivate func didAddTodo() {
        //delegate -> Callback
        if let todo = todoTextField.text {
            let todoModel:TodoModel = TodoModel(todoTitle: todo, todoDescripton: todoDescription.text!)
            delegate?.addTodoDidFinish(todoModel)
            navigationController?.popViewController(animated: true)
        }
        
//        if let todo = todoTextField.text {
//            delegate?.addTodoDidFinish(todo)
//            navigationController?.popViewController(animated: true)
//        }
    }
    
    fileprivate func setupUI() {
        let stackView:UIStackView = UIStackView(arrangedSubviews: [
            descriptionLable, todoTextField, todoDescription
            ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
}

//extension TodoTableViewController: AddTodoViewControllerDelegate {
//    func addTodoDidCancel(_ todo: String) {
//
//    }
//
//    func addTodoDidFinish(_ todo:String) {
//
//    }
//}
