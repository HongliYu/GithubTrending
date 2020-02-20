//
//  RepoService.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

enum RepoServiceResult<T> {
    case success(T)
    case failure(Error?)
}

typealias ReposCompletion = (RepoServiceResult<[Repo]>) -> Void

protocol RepoService: EndpointService {
    func fetchRepos(completion: @escaping ReposCompletion)
}
