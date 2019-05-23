//
//  CoreDataManager.swift
//  TodoItems
//
//  Created by SubaruShiozaki on 2019-05-16.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataManager {
  static let shared = CoreDataManager()
  
  private init() {}
  
  let persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "TodoEntity")
    container.loadPersistentStores { (storeDescription, error) in
      if let err = error {
        fatalError("Loading of persistent store failed: \(err)")
      }
    }
    return container
  }()
  
  func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch let saveErr {
        let err = saveErr as NSError
        fatalError("Unresolved error \(err), \(err.userInfo)")
      }
    }
  }
  
  func deleteContext(target:String) {
    let context = persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoEntity")
    fetchRequest.predicate = NSPredicate(format: "text = %@", target)
    do {
      let test = try context.fetch(fetchRequest)
      let objectTodoDelete = test[0] as! NSManagedObject
      context.delete(objectTodoDelete)
      
      do {
        try context.save()
      } catch {
        print(error)
      }
    } catch {
      print(error)
    }
  }
}
