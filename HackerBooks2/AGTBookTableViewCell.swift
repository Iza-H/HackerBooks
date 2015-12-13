//
//  AGTBookTableViewCell.swift
//  HackerBooks2
//
//  Created by Izabela on 13/12/15.
//  Copyright © 2015 Izabela. All rights reserved.
//

import UIKit



class AGTBookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
