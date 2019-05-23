//
//  AddItemTableViewController.swift
//  TodoItems
//
//  Created by Derrick Park on 2018-10-11.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import UIKit
import CoreData


protocol AddItemViewControllerDelegate: class {
  func addItemDidCancel()
  func addItemDidFinishAdding(_ item: TodoEntity)
  func addItemDidFinishEditing(_ item: TodoItem)
}

class AddItemTableViewController: UITableViewController {
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var cancelBarButton: UIBarButtonItem!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  weak var delegate: AddItemViewControllerDelegate?
  weak var itemToEdit: TodoItem?
  
  @IBAction func cancel(_ sender: UIBarButtonItem) {
    delegate?.addItemDidCancel()
  }
  
  // save data to core data
  @IBAction func done(_ sender: UIBarButtonItem) {
    let managedContext = CoreDataManager.shared.persistentContainer.viewContext
    if let item = itemToEdit, let text = textField.text {
      print("edit")
    } else {
      // create entity and input data
      let newTodoItem = NSEntityDescription.insertNewObject(forEntityName: "TodoEntity", into: managedContext)
      newTodoItem.setValue(textField.text, forKey: "text")
      newTodoItem.setValue(false, forKey: "checked")
      newTodoItem.setValue(1, forKey: "priority")
      
      // save it
      CoreDataManager.shared.saveContext()
      
      // back to previous screen
      self.delegate?.addItemDidFinishAdding(newTodoItem as! TodoEntity)
      self.navigationController?.popViewController(animated: true)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.largeTitleDisplayMode = .never
    if let item = itemToEdit {
      title = "Edit Todo Item"
      textField.text = item.value(forKey: "text") as? String
      doneBarButton.isEnabled = true
    }
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    textField.becomeFirstResponder()
  }
  
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    return nil
  }
  
}

extension AddItemTableViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    guard let oldText = textField.text, let stringRange = Range(range, in: oldText) else { return false }
    
    let newText = oldText.replacingCharacters(in: stringRange, with: string)
    
    doneBarButton.isEnabled = newText.isEmpty ? false : true
    return true
  }
}
