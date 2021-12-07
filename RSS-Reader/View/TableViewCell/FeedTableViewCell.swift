//
//  FeedTableViewCell.swift
//  RSS-Reader
//
//  Created by MBAir on 12/3/21.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var moreIcon: UIImageView!
    
    //MARK:- Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

