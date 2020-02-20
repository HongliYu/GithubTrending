//
//  CoreDataEntityConverter.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

protocol CoreDataEntityConverter {
    associatedtype BusinessObject

    func convertToBO() -> BusinessObject?
    func populate(with object: BusinessObject) throws
}

enum CoreDataConverterError: Error {
    case missingContext
}
