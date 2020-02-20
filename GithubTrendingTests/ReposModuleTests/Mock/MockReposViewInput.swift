//
//  MockReposViewInput.swift
//  GithubTrendingTests
//
//  Created by Hongli Yu on 2020/2/20.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

@testable import GithubTrending

final class MockReposViewInput: ReposViewInput, HasInvocations {

    enum Invocation: FakeEquatable {
        case display([RepoCellViewModel]?, Error?)
        case displayHistory([RepoCellViewModel]?, Error?)
    }
    var invocations: [Invocation] = []

    func display(repoCellViewModels: [RepoCellViewModel]?, error: Error?) {
        invocations.append(.display(repoCellViewModels, error))
    }

    func displayHistory(repoCellViewModels: [RepoCellViewModel]?, error: Error?) {
        invocations.append(.displayHistory(repoCellViewModels, error))
    }

}
