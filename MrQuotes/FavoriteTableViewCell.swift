//
//  FavoriteTableViewCell.swift
//  MrQuotes
//
//  Created by Yasin Shamrat on 22/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var quoteTopImage: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var quoteAuthor: UILabel!
    @IBOutlet weak var favoriteOutlet: UIButton!
    @IBOutlet weak var shareOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
