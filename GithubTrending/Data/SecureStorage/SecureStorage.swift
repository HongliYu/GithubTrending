//
//  SecureStorage.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

// For now only string, nothing generic
protocol SecureStorage {
    func readValue(forKey key: String) throws -> String
    func saveValue(_ value: String, forKey key: String) throws
    func deleteValue(forKey key: String) throws
}
