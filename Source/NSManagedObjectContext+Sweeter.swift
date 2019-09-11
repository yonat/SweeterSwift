//
//  NSManagedObjectContext+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import CoreData

extension NSManagedObjectContext {
    /// Sweeter: Dump contents to console - for debugging
    public func printAllObjects() {
        guard let entityDescriptions = persistentStoreCoordinator?.managedObjectModel.entities else { return }
        for entity in entityDescriptions {
            guard let entityName = entity.name else { continue }
            guard let objects = try? fetch(NSFetchRequest(entityName: entityName)) else { continue }
            print("== \(entityName) (\(objects.count)) ==")
            for object in objects {
                print(String(describing: object))
            }
        }
    }

    /// Sweeter: Create a copy of the store for backup or for using later as initial setup
    public func backupStore() {
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
