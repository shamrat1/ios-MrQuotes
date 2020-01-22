//
//  HomeTableViewCell.swift
//  MrQuotes
//
//  Created by Yasin Shamrat on 22/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit

protocol HomeTableViewCustomCellProtocol {
    func onClickFavoriteQuoteProtocolFunc(index: Int)
    
    func onClickShareQuoteProtocolFunc(index: Int)
}

class HomeTableViewCell: UITableViewCell {

    //delegate for protocol
    var cellDelegate: HomeTableViewCustomCellProtocol?
    //index var
    var index: IndexPath?
    // Cell Outlets
    @IBOutlet weak var quoteTopImage: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var quoteAuthor: UILabel!
    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    @IBOutlet weak var shareButtonOutlet: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onClickFavoriteQuote(_ sender: UIButton) {
        cellDelegate?.onClickFavoriteQuoteProtocolFunc(index: (index?.row)!)
    }
    
    @IBAction func onClickShareQuote(_ sender: Any) {
        cellDelegate?.onClickShareQuoteProtocolFunc(index: (index?.row)!)
    }
    
}
//extension HomeTableViewCell: HomeTableViewCustomCellProtocol {
//
//    func onClickFavoriteQuoteProtocolFunc(index: Int) {
//        <#code#>
//    }
//
//    func onClickShareQuoteProtocolFunc(index: Int) {
//        <#code#>
//    }
//
//
//}
