//
//  CoreDataRepoStorage.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import CoreData
import UIKit

final class CoreDataRepoStorage: RepoDataStorage {

    private let manager: CoreDataManager

    init(manager: CoreDataManager) {
        self.manager = manager
    }

    // MARK: RepoDataStorage
    func store(_ repo: Repo, completion: @escaping (Error?) -> Void) {
        guard let identifier = repo.identifier else { return }
        manager.persistentContainer.performBackgroundTask { context in
            do {
                let entity: RepoEntity
                if let storedEntity = try self.fetch(identifier, inContext: context) {
                    entity = storedEntity
                } else {
                    entity = RepoEntity(context: context)
                }
                try entity.populate(with: repo)
                try context.save()
                completion(nil)
            } catch let error {
                assertionFailure("\(#file):\(#line) Coredata failure: \(error)")
                context.rollback()
                completion(error)
            }
        }
    }

    func store(_ repos: [Repo], completion: @escaping (Error?) -> Void) {
        manager.persistentContainer.performBackgroundTask { context in
            do {
                for repo in repos {
                    guard let identifier = repo.identifier else { continue }
                    let entity: RepoEntity
                    if let storedEntity = try self.fetch(identifier, inContext: context) {
                        entity = storedEntity
                    } else {
                        entity = RepoEntity(context: context)
                    }
                    try entity.populate(with: repo)
                }
                try context.save()
                completion(nil)
            } catch {
                assertionFailure("\(#file):\(#line) Coredata failure: \(error)")
                context.rollback()
                completion(error)
            }
        }
    }

    func loadRecent(numerOfItems: Int,
                    completion: @escaping (RepoDataStorageResult<[Repo]>) -> Void) {
        manager.persistentContainer.performBackgroundTask { context in
            let request: NSFetchRequest<RepoEntity> = RepoEntity.fetchRequest()
            request.fetchLimit = numerOfItems
            request.sortDescriptors = [NSSortDescriptor(key: "stars", ascending: false)]
            do {
                let results = try context.fetch(request)
                let articles = results.compactMap { entity -> Repo? in
                    return entity.convertToBO()
                }
                completion(.success(articles))
            } catch let error {
                completion(.failure(error))
            }
        }
    }

    private func fetch(_ identifier: Int64,
                       inContext context: NSManagedObjectContext) throws -> RepoEntity? {
        let request: NSFetchRequest<RepoEntity> = RepoEntity.fetchRequest()
        request.predicate = NSPredicate(format: "identifier == %@", identifier as NSNumber)
        request.fetchLimit = 1
        let results = try context.fetch(request)
        return results.first
    }

}
