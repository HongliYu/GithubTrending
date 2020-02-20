//
//  StatusCodeValidator.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

protocol StatusCodeValidator {
    func validate(for response: URLResponse, data: Data?) throws
}
