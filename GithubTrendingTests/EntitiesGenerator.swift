//
//  EntitiesGenerator.swift
//  GithubTrendingTests
//
//  Created by Hongli Yu on 2020/2/20.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation
@testable import GithubTrending

final class EntitiesGenerator {

    func createRepos() -> [Repo] {
        var repos = [Repo]()
        let user = User(identifier: 1001, name: "", avatarURL: "", profileURL: "")
        let license = License(key: "", name: "", spdxID: "", url: "", identifier: "")
        let repo = Repo(identifier: 1001, name: "", desc: "", stars: 1002,
                        forks: 1003, watchers: 1004, isPrivateProject: false,
                        openIssues: 1005, htmlURL: "", owner: user,
                        license: license)
        repos.append(repo)
        return repos
    }

}
