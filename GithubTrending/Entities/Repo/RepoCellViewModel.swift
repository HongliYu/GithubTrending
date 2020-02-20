//
//  RepoCellViewModel.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

class RepoCellViewModel {

    private let repo: Repo

    init?(repo: Repo) {
        self.repo = repo
    }

    var identifier: Int64? {
        return repo.identifier
    }

    var name: String? {
        return repo.name
    }

    var desc: String? {
        return repo.desc
    }

    var author: String? {
        return repo.owner?.name
    }

    var profileURL: String? {
        return repo.owner?.avatarURL
    }

    var stars: String? {
        return "stars: " + String(repo.stars ?? 0)
    }

    var starsCount: Int64 {
        return repo.stars ?? 0
    }

    var forks: String? {
        return "forks: " + String(repo.forks ?? 0)
    }

    var htmlURL: String? {
        return repo.htmlURL
    }

}

extension RepoCellViewModel: Equatable {

    public static func == (lhs: RepoCellViewModel, rhs: RepoCellViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }

}
