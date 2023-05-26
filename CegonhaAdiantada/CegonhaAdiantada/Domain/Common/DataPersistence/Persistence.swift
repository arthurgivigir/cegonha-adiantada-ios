//
//  Persistence.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 12/04/23.
//

import CoreData

struct PersistenceController {
    
    // A singleton for our entire app to use
    static let shared = PersistenceController()
    
    // A test configuration for SwiftUI previews
    static let preview = PersistenceController.previewPersistenceController.container.viewContext
    
    // Storage for Core Data
    let container: NSPersistentCloudKitContainer
    
    // A test configuration for SwiftUI previews
    private static var previewPersistenceController: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        for _ in 0...10 {
            let newItem = CalculusJson(context: controller.container.viewContext)
            newItem.dateTime = .now
            newItem.json = Calculus(date: .now, birthDate: .now, result: Result(weeks: "1", days: "2", totalDays: "3")).toJson
        }
        
        do {
            try controller.container.viewContext.save()
        } catch {
            // Something went wrong 😭
            print("Failed to save test calculus: \(error)")
        }
        
        return controller
    }()

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentCloudKitContainer(name: "CegonhaAdiantada")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // Save() method to your PersistenceController class so
    // that it checks whether the context has changes and commits them if needed.
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }
}
