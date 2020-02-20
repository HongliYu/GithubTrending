//
//  MockRepoDataStorage.swift
//  GithubTrendingTests
//
//  Created by Hongli Yu on 2020/2/20.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation
@testable import GithubTrending

final class MockRepoDataStorage: RepoDataStorage, HasInvocations {

    enum Invocation: FakeEquatable {
        case store(Repo)
        case storeRepos([Repo])
        case loadRecent(Int)
    }

    var invocations: [Invocation] = [] {
        didSet {
            invocationsDidChange?()
        }
    }

    var invocationsDidChange: (() -> Void)?
    var mockedRepo: Repo?
    var mockedRepos: [Repo]?
    var error: Error?

    func store(_ repo: Repo, completion: @escaping (Error?) -> Void) {
        mockedRepo = repo
        invocations.append(.store(repo))
        completion(error)
    }

    func store(_ repos: [Repo], completion: @escaping (Error?) -> Void) {
        invocations.append(.storeRepos(repos))
    }

    var repoDataStorageResult: RepoDataStorageResult<[Repo]>!
    func loadRecent(numerOfItems: Int, completion: @escaping (RepoDataStorageResult<[Repo]>) -> Void) {
        invocations.append(.loadRecent(numerOfItems))
        completion(repoDataStorageResult)
    }

}
