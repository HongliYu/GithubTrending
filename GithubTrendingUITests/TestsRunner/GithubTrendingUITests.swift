//
//  GithubTrendingUITests.swift
//  GithubTrendingUITests
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import XCTest
import XCTest_Gherkin
@testable import GithubTrending

class GithubTrendingUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {

    }

    func testBasic() {
        NativeRunner.runFeature(featureFile: "basic.feature", testCase: self)
    }
}
