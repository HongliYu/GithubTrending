//
//  ReposModuleBuilderTests.swift
//  GithubTrendingTests
//
//  Created by Hongli Yu on 2020/2/20.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import XCTest
@testable import GithubTrending

final class ReposModuleBuilderTests: XCTestCase {

    func testBuild() {
        // given
        let builder = ReposModuleBuilder()

        // when
        let vc = builder.build() as? ReposViewController

        // then
        XCTAssertNotNil(vc)
        XCTAssertNotNil(vc?.output)

        let presenter = vc?.output as? ReposPresenter
        XCTAssertNotNil(presenter)
        XCTAssertNotNil(presenter?.view)
        XCTAssertNotNil(presenter?.router)
        XCTAssertNotNil(presenter?.interactor)

        let router = presenter?.router as? ReposRouter
        XCTAssertNotNil(router)

        let interactor = presenter?.interactor as? ReposInteractor
        XCTAssertNotNil(interactor)
        XCTAssertNotNil(interactor?.output)
    }
}
