//
//  FavoriteTableViewCell.swift
//  MrQuotes
//
//  Created by Yasin Shamrat on 22/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit

protocol FavoriteCellProtocol{
    func onClickFavoriteForFavoriteCellProtocol(index: Int)
    func onClickShareForFavoriteCellProtocol(index: Int)
}

class FavoriteTableViewCell: UITableViewCell {
    var cellDelegate: FavoriteCellProtocol?
    var index: IndexPath?
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
    @IBAction func onClickFavorite(_ sender: Any) {
        cellDelegate?.onClickFavoriteForFavoriteCellProtocol(index: index!.row)
    }
    @IBAction func onClickShare(_ sender: UIButton) {
        cellDelegate?.onClickShareForFavoriteCellProtocol(index: index!.row)
    }
    
}
