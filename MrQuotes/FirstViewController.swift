//
//  FirstViewController.swift
//  MrQuotes
//
//  Created by Yasin Shamrat on 21/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit

var quotes = [
    ["quote":"Some random thing said by random people.","author":"Anonymous","isFavorite":1],
    ["quote":"Some random thing said by random people to inspire random people.","author":"Steve Jobs","isFavorite":1],
    ["quote":"Some random thing said by random people to inspre random people to do random things","author":"Bill Murray","isFavorite":0],
    ["quote":"Some random thing said by random people to inspre random people to do random things that will bring random change.","author":"John Denver","isFavorite":0],
    ["quote":"Some random thing said by random people to inspre random people to do random things that will bring random change to the random planet on universe.","author":"Sheikh Hasina","isFavorite":0]
]

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as? HomeTableViewCell
        cell?.cellDelegate = self
        cell?.index = indexPath
        cell?.quoteLabel.text = quotes[indexPath.row]["quote"] as? String
        cell?.quoteAuthor.text = quotes[indexPath.row]["author"] as? String
        if quotes[indexPath.row]["isFavorite"] as! Int == 1{
            print(quotes[indexPath.row])
            cell?.quoteTopImage.tintColor = UIColor(named: "Color2")
            cell?.favoriteButtonOutlet.tintColor = UIColor.red
            cell?.favoriteButtonOutlet.setImage(#imageLiteral(resourceName: "favorite_fill"), for: .normal)
            cell?.shareButtonOutlet.tintColor = UIColor(named: "Color2")
        }else{
            cell?.favoriteButtonOutlet.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
            cell?.quoteTopImage.tintColor = UIColor(named: "Color1")
            cell?.favoriteButtonOutlet.tintColor = UIColor(named: "Color1")
            cell?.shareButtonOutlet.tintColor = UIColor(named: "Color1")
        }
        return cell!
    }
}

extension FirstViewController: HomeTableViewCustomCellProtocol{
    func onClickFavoriteQuoteProtocolFunc(index: Int) {
        
        print("Before Change: \(quotes[index]["isFavorite"] as! Int)")
        if quotes[index]["isFavorite"] as! Int == 0 {
            quotes[index]["isFavorite"] = 1
        }else{
            quotes[index]["isFavorite"] = 0
        }
        self.tableView.reloadData()
        print("After Change: \(quotes[index]["isFavorite"] as! Int)")
    }
    
    func onClickShareQuoteProtocolFunc(index: Int) {
        print("Share Button Clicked at \(index)")
        let item = [quotes[index]["quote"],"By \(String(describing: quotes[index]["author"]))"]
        let shareSheet = UIActivityViewController(activityItems: item, applicationActivities: nil)
        self.present(shareSheet, animated: true, completion: nil)
    }
}

