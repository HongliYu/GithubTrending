//
//  MockReposService.swift
//  GithubTrendingTests
//
//  Created by Hongli Yu on 2020/2/20.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

@testable import GithubTrending

final class MockReposService: RepoService, HasInvocations {

    enum Invocation: FakeEquatable {
        case fetchRepos
    }
    var invocations: [Invocation] = []

    let webService: WebService = MockWebService()

    var reposServiceResult: RepoServiceResult<[Repo]>!
    func fetchRepos(completion: @escaping ReposCompletion) {
        invocations.append(.fetchRepos)
        completion(reposServiceResult)
    }

}
