//
//  RepoAPITest.swift
//  GithubTrendingTests
//
//  Created by Hongli Yu on 2020/2/20.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import XCTest
@testable import GithubTrending

class GithubTrending: XCTestCase {

    func testFetchRepos() {
        let expectation = self.expectation(description: "testFetchRepos")
        let service: RepoService = RepoServiceImpl()
        service.fetchRepos { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let repos):
                    XCTAssertTrue(repos.count > 0)
                case .failure(let error):
                    print(error ?? "error is nil")
                }
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5) { (error) in
            print(error.debugDescription)
        }
    }

}
