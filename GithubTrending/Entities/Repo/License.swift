//
//  License.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

struct License: Codable {

    let key: String?
    let name: String?
    let spdxID: String?
    let url: String?
    let identifier: String?

    enum CodingKeys: String, CodingKey {
        case key
        case name
        case spdxID = "spdx_id"
        case url = "url"
        case identifier = "node_id"
    }

}
