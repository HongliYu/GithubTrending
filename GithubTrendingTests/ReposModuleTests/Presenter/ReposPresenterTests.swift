//
//  ReposPresenterTests.swift
//  GithubTrendingTests
//
//  Created by Hongli Yu on 2020/2/20.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import XCTest
@testable import GithubTrending

final class ReposPresenterTests: XCTestCase {

    var presenter: ReposPresenter!
    var view: MockReposViewInput!
    var interactor: MockReposInteractorInput!
    var router: MockReposRouterInput!

    override func setUp() {
        super.setUp()

        view = MockReposViewInput()
        interactor = MockReposInteractorInput()
        router = MockReposRouterInput()

        presenter = ReposPresenter()
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
    }

    override func tearDown() {
        view = nil
        interactor = nil
        router = nil
        presenter = nil

        super.tearDown()
    }

    func testViewIsReady() {
        // given

        // when
        presenter.viewIsReady()

        // then
        XCTAssertEqual(interactor.invocations[0], .fetchReposHistory)
    }

    func testRefreshRepos() {
        // given

        // when
        presenter.refreshRepos()

        // then
        XCTAssertEqual(interactor.invocations[0], .fetchRepos)
    }

}
