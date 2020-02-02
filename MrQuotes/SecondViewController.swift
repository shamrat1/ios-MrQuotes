//
//  SecondViewController.swift
//  MrQuotes
//
//  Created by Yasin Shamrat on 21/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var quotes = [Quote]()
    var favorites: [[String:Any]] = []
    @IBOutlet weak var tableView: UITableView!
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
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
        loadItems()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        favorites = []
//        for object in quotes{
//            if object["isFavorite"] as? Bool == true{
//                favorites.append(object)
//            }
//        }
//        self.tableView.reloadData()
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? FavoriteTableViewCell
        //        cell?.cellDelegate = self
        cell?.index = indexPath
        cell?.quoteLabel.text = quotes[indexPath.row].quote
        cell?.quoteAuthor.text = quotes[indexPath.row].author
        if quotes[indexPath.row].isFavorite {
            print(quotes[indexPath.row])
            cell?.quoteTopImage.tintColor = UIColor(named: "Color2")
            cell?.favoriteOutlet.tintColor = UIColor.red
            cell?.favoriteOutlet.setImage(#imageLiteral(resourceName: "heartfull"), for: .normal)
            cell?.shareOutlet.tintColor = UIColor(named: "Color2")
        }else{
            cell?.favoriteOutlet.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
            cell?.quoteTopImage.tintColor = UIColor(named: "Color1")
            cell?.favoriteOutlet.tintColor = UIColor(named: "Color1")
            cell?.shareOutlet.tintColor = UIColor(named: "Color1")
        }
        return cell!
    }
    func loadItems(with request : NSFetchRequest<Quote> = Quote.fetchRequest()) {
        print("loading favorites")
        request.predicate = NSPredicate(format: "isFavorite == %@", NSNumber(value: true))
        let context = delegate.persistentContainer.viewContext
        do {
            quotes = try context.fetch(request)
        } catch{
            print("Error in load item : \(error)")
        }
        
        self.tableView.reloadData()
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
//extension SecondViewController : FavoriteCellProtocol{
//    func onClickFavoriteForFavoriteCellProtocol(index: Int) {
//        print()
////        print("Before Change: \(quotes[index]["isFavorite"] as! Int)")
//        quotes[index]["isFavorite"] = 0
//        self.viewWillAppear(true)
//        print("After Change: \(quotes[index]["isFavorite"] as! Int)")
//    }
//    
//    func onClickShareForFavoriteCellProtocol(index: Int) {
//        print("Share Button Clicked at \(index)")
//        let item = [quotes[index]["quote"],"By \(String(describing: quotes[index]["author"]!))"]
//        let shareSheet = UIActivityViewController(activityItems: item as [Any], applicationActivities: nil)
//        self.present(shareSheet, animated: true, completion: nil)    }
//    
//    
//}
