//
//  MockReposInteractorOutput.swift
//  GithubTrendingTests
//
//  Created by Hongli Yu on 2020/2/20.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

@testable import GithubTrending

final class MockReposInteractorOutput: ReposInteractorOutput, HasInvocations {

    enum Invocation: FakeEquatable {
        case didReceive(repos: [Repo]?, error: Error?)
        case didReceiveFromDisk(repos: [Repo]?, error: Error?)
    }

    var invocations: [Invocation] = [] {
        didSet {
            invocationsDidChange?()
        }
    }
    var invocationsDidChange: (() -> Void)?

    func didReceive(repos: [Repo]?, error: Error?) {
        invocations.append(.didReceive(repos: repos, error: error))
    }

    func didReceiveFromDisk(repos: [Repo]?, error: Error?) {
        invocations.append(.didReceiveFromDisk(repos: repos, error: error))
    }

}
