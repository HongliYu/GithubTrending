//
//  ReposInteractorTests.swift
//  GithubTrendingTests
//
//  Created by Hongli Yu on 2020/2/20.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import XCTest
@testable import GithubTrending

final class ReposInteractorTests: XCTestCase {

    var interactor: ReposInteractor!
    var output: MockReposInteractorOutput!
    var reposService: MockReposService!
    var dataStorage: MockRepoDataStorage!

    override func setUp() {
        super.setUp()

        output = MockReposInteractorOutput()
        reposService = MockReposService()
        dataStorage = MockRepoDataStorage()
        interactor = ReposInteractor.init(repoService: reposService, dataStorage: dataStorage)
        interactor.output = output
    }

    override func tearDown() {
        output = nil
        reposService = nil
        dataStorage = nil
        interactor = nil

        super.tearDown()
    }

    func testFetchRepos() {
        // given
        let repos = EntitiesGenerator().createRepos()
        reposService.reposServiceResult = .success(repos)
        let expect = expectation(description: "testFetchRepos expectation")
        output.invocationsDidChange = {
            if self.output.invocations.contains(.didReceive(repos: repos, error: nil)) {
                expect.fulfill()
            }
        }

        // when
        interactor.fetchRepos()

        // then
        reposService.checkInvocations([.fetchRepos])
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFetchReposHistory() {
        // given
        let repos = EntitiesGenerator().createRepos()
        dataStorage.repoDataStorageResult = .success(repos)
        let expect = expectation(description: "testFetchReposHistory expectation")
        output.invocationsDidChange = {
        if self.output.invocations.contains(.didReceiveFromDisk(repos: repos, error: nil)) {
                expect.fulfill()
            }
        }

        // when
        interactor.fetchReposHistory()

        // then
        dataStorage.checkInvocations([.loadRecent(24)])
        waitForExpectations(timeout: 5, handler: nil)
    }

}
