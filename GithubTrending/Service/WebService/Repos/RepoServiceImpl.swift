//
//  RepoServiceImpl.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

final class RepoServiceImpl: RepoService {

    lazy var webService: WebService = WebServiceImpl()

    private enum Endpoints {
        static let topHeadlines = "/v2/trending"
    }

    func fetchRepos(completion: @escaping ReposCompletion) {
        let endpoint = String(format: Endpoints.topHeadlines)

        let validator = ReposStatusCodeValidator()
        let meta = RequestMetaImpl(isUserInitiated: false, statusCodeValidator: validator)
        let queryItems = [URLQueryItem(name: "since", value: "daily")]
        webService.call(endpoint: endpoint,
                        source: .codehub,
                        queryItems: queryItems,
                        body: nil,
                        method: .get,
                        meta: meta) { result in
                            switch result {
                            case .success(let data, _):
                                do {
                                    let decoder = JSONDecoderEncoderBuilder().buildDecoder()
                                    let articleList = try decoder.decode([Repo].self, from: data)
                                    completion(.success(articleList))
                                } catch let error {
                                    completion(.failure(error))
                                }
                            case .failure(let error):
                                completion(.failure(error))
                            }
        }
    }

}
