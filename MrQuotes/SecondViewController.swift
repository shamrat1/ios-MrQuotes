//
//  SecondViewController.swift
//  MrQuotes
//
//  Created by Yasin Shamrat on 21/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var quotes = [
        ["quote":"Some random thing said by random people.","author":"Anonymous","isFavorite":1],
        ["quote":"Some random thing said by random people to inspire random people.","author":"Steve Jobs","isFavorite":1],
        ["quote":"Some random thing said by random people to inspre random people to do random things","author":"Bill Murray","isFavorite":0],
        ["quote":"Some random thing said by random people to inspre random people to do random things that will bring random change.","author":"John Denver","isFavorite":0],
        ["quote":"Some random thing said by random people to inspre random people to do random things that will bring random change to the random planet on universe.","author":"Sheikh Hasina","isFavorite":0]
    ]
    var favorites: [[String:Any]] = []
    @IBOutlet weak var tableView: UITableView!
   // for refreshing
//    lazy var refreshControl: UIRefreshControl = {
//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: #selector(SecondViewController.handleRefresh(_:)), for: UIControl.Event.valueChanged)
//        refreshControl.tintColor = UIColor.red
//
//        return refreshControl
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.allowsSelection = false
//        self.tableView.addSubview(self.refreshControl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favorites = []
        for object in quotes{
            if object["isFavorite"] as! Int == 1{
                favorites.append(object)
            }
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteTableViewCell
        cell.cellDelegate = self
        cell.index = indexPath
        cell.quoteTopImage.tintColor = UIColor(named: "Color2")
        cell.quoteLabel.text = (favorites[indexPath.row]["quote"] as! String)
        cell.quoteAuthor.text = (favorites[indexPath.row]["author"] as! String)
        cell.favoriteOutlet.setImage(#imageLiteral(resourceName: "heartfull"), for: .normal)
        cell.favoriteOutlet.tintColor = UIColor.red
        cell.shareOutlet.tintColor = UIColor(named: "Color2")
        
        return cell
    }
    
    
    //for refreshing
//    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
//        // Do some reloading of data and update the table view's data source
//        // Fetch more objects from a web service, for example..
//
//        self.tableView.reloadData()
//        refreshControl.endRefreshing()
//    }
    
}
extension SecondViewController : FavoriteCellProtocol{
    func onClickFavoriteForFavoriteCellProtocol(index: Int) {
        print()
//        print("Before Change: \(quotes[index]["isFavorite"] as! Int)")
        quotes[index]["isFavorite"] = 0
        self.viewWillAppear(true)
        print("After Change: \(quotes[index]["isFavorite"] as! Int)")
    }
    
    func onClickShareForFavoriteCellProtocol(index: Int) {
        print("Share Button Clicked at \(index)")
        let item = [quotes[index]["quote"],"By \(String(describing: quotes[index]["author"]!))"]
        let shareSheet = UIActivityViewController(activityItems: item as [Any], applicationActivities: nil)
        self.present(shareSheet, animated: true, completion: nil)    }
    
    
}
