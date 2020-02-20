//
//  RepoDataStorage.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

enum RepoDataStorageResult<T> {
    case success(T)
    case failure(Error?)
}

protocol RepoDataStorage {
    func store(_ repo: Repo, completion: @escaping (Error?) -> Void)
    func store(_ repos: [Repo], completion: @escaping (Error?) -> Void)
    func loadRecent(numerOfItems: Int, completion: @escaping (RepoDataStorageResult<[Repo]>) -> Void)
}
