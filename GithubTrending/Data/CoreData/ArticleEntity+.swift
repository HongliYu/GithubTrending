//
//  ArticleEntity+.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import CoreData

extension RepoEntity: CoreDataEntityConverter {

    func convertToBO() -> Repo? {
        return Repo(identifier: identifier, name: name, desc: desc,
                    stars: stars, forks: forks, watchers: watchers,
                    isPrivateProject: isPrivateProject, openIssues: openIssues,
                    htmlURL: htmlURL, owner: owner?.convertToBO(),
                    license: license?.convertToBO())
    }

    func populate(with object: Repo) throws {
        guard let context = managedObjectContext else {
            assertionFailure("\(#file):\(#line) Missing context")
            throw CoreDataConverterError.missingContext
        }
        identifier = object.identifier ?? 0
        name = object.name
        desc = object.desc
        stars = object.stars ?? 0
        forks = object.forks ?? 0
        watchers = object.watchers ?? 0
        isPrivateProject = object.isPrivateProject ?? false
        openIssues = object.openIssues ?? 0
        htmlURL = object.htmlURL
        if let objectSource = object.owner {
            let owner = self.owner ?? UserEntity(context: context)
            try owner.populate(with: objectSource)
            self.owner = owner
        }
        if let objectSource = object.license {
            let license = self.license ?? LicenseEntity(context: context)
            try license.populate(with: objectSource)
            self.license = license
        }
    }

}

extension UserEntity: CoreDataEntityConverter {

    func convertToBO() -> User? {
        guard let name = name, let avatarURL = avatarURL, let profileURL = profileURL else {
            return nil
        }
        return User(identifier: identifier, name: name,
                    avatarURL: avatarURL, profileURL: profileURL)
    }

    func populate(with object: User) throws {
        identifier = object.identifier ?? 0
        name = object.name
        avatarURL = object.avatarURL
        profileURL = object.profileURL
    }

}

extension LicenseEntity: CoreDataEntityConverter {

    func convertToBO() -> License? {
        guard let key = key, let name = name,
            let spdxID = spdxID, let url = url,
            let identifier = identifier else {
            return nil
        }
        return License(key: key, name: name, spdxID: spdxID,
                       url: url, identifier: identifier)
    }

    func populate(with object: License) throws {
        key = object.key
        identifier = object.identifier
        name = object.name
        spdxID = object.spdxID
        url = object.url
    }

}
