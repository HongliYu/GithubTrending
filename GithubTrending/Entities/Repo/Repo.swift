//
//  Repo.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

struct Repo: Codable {

    let identifier: Int64?
    let name: String?
    let desc: String?
    let stars: Int64?
    let forks: Int64?
    let watchers: Int64?
    let isPrivateProject: Bool?
    let openIssues: Int64?
    let htmlURL: String?
    let owner: User?
    let license: License?

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case owner
        case desc = "description"
        case stars = "stargazers_count"
        case forks
        case watchers
        case isPrivateProject = "private"
        case openIssues = "open_issues"
        case license
        case htmlURL = "html_url"
    }

}

extension Repo: Equatable {

    public static func == (lhs: Repo, rhs: Repo) -> Bool {
        return lhs.identifier == rhs.identifier
    }

}
