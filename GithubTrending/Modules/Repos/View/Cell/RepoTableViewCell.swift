//
//  RepoTableViewCell.swift
//  GithubTrending
//
//  Created by Hongli Yu on 2020/2/19.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDescLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    private var cellModel: RepoCellViewModel?

    func bindData(_ cellModel: RepoCellViewModel) {
        if self.cellModel != nil && self.cellModel == cellModel {
            return
        }
        self.cellModel = cellModel
        repoNameLabel.text = cellModel.name
        repoDescLabel.text = cellModel.desc
        starLabel.text = cellModel.stars
        forkLabel.text = cellModel.forks
        authorLabel.text = cellModel.author
        if let imageURL = cellModel.profileURL {
            profileImageView.imageFromServerURL(imageURL, placeHolder: nil)
        }
    }

}
