//
//  RequestMeta.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

protocol RequestMeta {
    var isUserInitiated: Bool { get }
    var statusCodeValidator: StatusCodeValidator { get }
}

struct RequestMetaImpl: RequestMeta {
    let isUserInitiated: Bool
    let statusCodeValidator: StatusCodeValidator
}
