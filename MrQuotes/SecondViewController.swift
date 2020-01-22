//
//  SecondViewController.swift
//  MrQuotes
//
//  Created by Yasin Shamrat on 21/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        cell.quoteTopImage.tintColor = UIColor(named: "Color2")
        cell.quoteLabel.text = (favorites[indexPath.row]["quote"] as! String)
        cell.quoteAuthor.text = (favorites[indexPath.row]["author"] as! String)
        cell.favoriteOutlet.setImage(#imageLiteral(resourceName: "favorite_fill"), for: .normal)
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

