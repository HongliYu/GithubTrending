//
//  User.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

struct User: Codable {

    let identifier: Int64?
    let name: String?
    let avatarURL: String?
    let profileURL: String?

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "login"
        case profileURL = "url"
        case avatarURL = "avatar_url"
    }

}

extension User: Equatable {

    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.identifier == rhs.identifier
    }

}
