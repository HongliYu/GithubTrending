//
//  ReposRouterTests.swift
//  GithubTrendingTests
//
//  Created by Hongli Yu on 2020/2/20.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import XCTest
@testable import GithubTrending

final class ReposRouterTests: XCTestCase {

    var router: ReposRouter!
    var viewController: MockViewController!
    var navigationController: MockNavigationViewController!

    override func setUp() {
        super.setUp()

        router = ReposRouter()
        viewController = MockViewController()
        navigationController = MockNavigationViewController(rootViewController: viewController)
        router.viewController = viewController
    }

    override func tearDown() {
        router = nil
        viewController = nil
        navigationController = nil

        super.tearDown()
    }

    func testDisplayNewsDetails() {
        // given
        let repos = EntitiesGenerator().createRepos()
        navigationController.invocations = []

        // when
        guard let htmlURL = repos.first?.htmlURL else {
            return
        }
        router.displayRepoDetails(urlString: htmlURL)

        // then
        navigationController.checkInvocations([.push])
        XCTAssertNotNil(navigationController.pushedVC as? RepoDetailViewController)
    }

}
