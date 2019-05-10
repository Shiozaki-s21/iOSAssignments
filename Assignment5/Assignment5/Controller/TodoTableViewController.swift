//
//  ViewController.swift
//  Assignment5
//
//  Created by SubaruShiozaki on 2019-05-02.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//
import UIKit

// delegate, datasource automatically conformed
// - tableView (var)
class TodoTableViewController: UITableViewController {
    
    // MARK: - Properties
    private var todos: [TodoModel] = [TodoModel]()
    
    // MARK: - Constants
    private let cellId = "todoCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: cellId)
        // editButtonItem comes with isEditing: Bool
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodo))
        tableView.allowsMultipleSelectionDuringEditing = true
        
        //add Gesture
        let gestureRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(
            target: self,
            action: #selector(reloadViews))
        
            view.addGestureRecognizer(gestureRecognizer)
        }
    // method which is called by recognizer
    @objc func reloadViews() {
        print("aaa")
        tableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    @objc func addTodo() {
        // go to add todo view controller
        let addTodoVC = AddTodoViewController()
        addTodoVC.delegate = self
        navigationController?.pushViewController(addTodoVC, animated: true)
    }
    
    // MARK: - tableview data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // how many rows?
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // for each cell?
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodoTableViewCell
        cell.todoName.text = todos[indexPath.row].todoTitle
        
        return cell
    }
    
}

// MARK: - Table view delegate
extension TodoTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewTodoView = ViewTodoViewController()
        viewTodoView.todoDescription = "TodoDescription"
        viewTodoView.todoTitle = "TodoTitle"
        
        navigationController?.pushViewController(viewTodoView, animated: true)
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            break
        case .delete:
            break
        default:
            break
        }
    }
    
    // moving for cells
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}


// MARK: - AddTodoViewControllerDelegate

extension TodoTableViewController: AddTodoViewControllerDelegate {

    func addTodoDidCancel() {

    }

//    func addTodoDidFinish(_ todo: String) {
//        todos.append(todo)
//        tableView.reloadData()
//    }
    
    func addTodoDidFinish(_ todo: TodoModel) {
        todos.append(todo)
        tableView.reloadData()
    }
}

//extension TodoTableViewController: AddTodoViewControllerDelegate {
//    func addTodoDidCancel() {
//
//    }
//
//    func addTodoDidFinish() {
//}
