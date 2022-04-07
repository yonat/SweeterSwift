//
//  NSManagedObjectContext+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import CoreData

public extension NSManagedObjectContext {
    /// Sweeter: Names of all entities in the object model associated with the receiver
    var allEntityNames: [String] {
        return persistentStoreCoordinator?.managedObjectModel.entities.compactMap(\.name) ?? []
    }

    /// Sweeter: Delete all objects, or all objects of specific entity name(s).
    func deleteAllObjects(entityName: String...) throws {
        let entityNames = entityName.isEmpty ? allEntityNames : entityName
        for entityName in entityNames {
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            try execute(deleteRequest)
        }
    }

    /// Sweeter: Dump contents to console - for debugging
    func printAllObjects(entityName: String...) {
        let entityNames = entityName.isEmpty ? allEntityNames : entityName
        for entityName in entityNames {
            guard let objects = try? fetch(NSFetchRequest<NSFetchRequestResult>(entityName: entityName)) else { continue }
            print("== \(entityName) (\(objects.count)) ==")
            for object in objects {
                print(String(describing: object))
            }
        }
    }

    /// Sweeter: Create a copy of the store for backup or for using later as initial setup
    func backupStore() {
        guard let persistentStoreCoordinator = persistentStoreCoordinator else { return }
        guard let sourceStore = persistentStoreCoordinator.persistentStores.first else { return }
        let backupCoordinator = NSPersistentStoreCoordinator(managedObjectModel: persistentStoreCoordinator.managedObjectModel)

        let intermediateStoreOptions = (sourceStore.options ?? [:]).merging([NSReadOnlyPersistentStoreOption: true], uniquingKeysWith: { $1 })
        guard let intermediateStore = try? backupCoordinator.addPersistentStore(
            ofType: sourceStore.type,
            configurationName: sourceStore.configurationName,
            at: sourceStore.url,
            options: intermediateStoreOptions
        ) else { return }

        let backupStoreOptions: [AnyHashable: Any] = [
            NSReadOnlyPersistentStoreOption: true,
            // Disable write-ahead logging so that the entire store will be
            // contained in a single file. No need to handle -wal/-shm files.
            // https://developer.apple.com/library/content/qa/qa1809/_index.html
            NSSQLitePragmasOption: ["journal_mode": "DELETE"],
            // Minimize file size
            NSSQLiteManualVacuumOption: true,
        ]

        let basename = sourceStore.url?.deletingPathExtension().lastPathComponent ?? "store"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? URL(fileURLWithPath: ".")
        let backupURL = documentsDirectory.appendingPathComponent("\(basename)-backup.sqlite")
        print("Backed up store to " + backupURL.path)
        _ = try? backupCoordinator.migratePersistentStore(intermediateStore, to: backupURL, options: backupStoreOptions, withType: NSSQLiteStoreType)
    }
}
