//
//  MockReposInteractorInput.swift
//  GithubTrendingTests
//
//  Created by Hongli Yu on 2020/2/20.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

@testable import GithubTrending

final class MockReposInteractorInput: ReposInteractorInput, HasInvocations {

    enum Invocation: FakeEquatable {
        case fetchRepos
        case fetchReposHistory
    }
    var invocations: [Invocation] = []

    func fetchRepos() {
        invocations.append(.fetchRepos)
    }

    func fetchReposHistory() {
        invocations.append(.fetchReposHistory)
    }

}
