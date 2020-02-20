//
//  APISource.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

enum APISource {

    case github
    case codehub

    var scheme: String {
        switch self {
        case .github:
            return "https"
        case .codehub:
            return "http"
        }
    }

    var baseURL: String {
        switch self {
        case .github:
            return "api.github.com"
        case .codehub:
            return "trending.codehub-app.com"
        }
    }

}
