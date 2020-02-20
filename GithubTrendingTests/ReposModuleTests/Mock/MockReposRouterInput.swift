//
//  MockReposRouterInput.swift
//  GithubTrendingTests
//
//  Created by Hongli Yu on 2020/2/20.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

@testable import GithubTrending

final class MockReposRouterInput: ReposRouterInput, HasInvocations {

    enum Invocation: FakeEquatable {
        case displayRepoDetails(String)
    }
    var invocations: [Invocation] = []

    func displayRepoDetails(urlString: String) {
        invocations.append(.displayRepoDetails(urlString))
    }

}
