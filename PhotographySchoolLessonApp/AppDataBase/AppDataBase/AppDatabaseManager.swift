//
//  AppDatabaseManager.swift
//  AppDataBase
//
//  Created by Ahmed Mohiy on 26/01/2023.
//

import Foundation
import CoreData

class AppDatabaseManager {

    //MARK: - Variables
    static let `default`: AppDatabaseManager = AppDatabaseManager()
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AppDataBaseModel")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as? NSError {
                fatalError("load database err: \(error), userInfo: \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    //MARK: Save to data base
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("save database error: \(error)")
            }
        }
    }
}
