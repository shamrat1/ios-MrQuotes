//
//  FirstViewController.swift
//  MrQuotes
//
//  Created by Yasin Shamrat on 21/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit
import CoreData

//var quotes = [
//    ["quote":"Some random thing said by random people.","author":"Anonymous","isFavorite":1],
//    ["quote":"Some random thing said by random people to inspire random people.","author":"Steve Jobs","isFavorite":1],
//    ["quote":"Some random thing said by random people to inspre random people to do random things","author":"Bill Murray","isFavorite":0],
//    ["quote":"Some random thing said by random people to inspre random people to do random things that will bring random change.","author":"John Denver","isFavorite":0],
//    ["quote":"Some random thing said by random people to inspre random people to do random things that will bring random change to the random planet on universe.","author":"Sheikh Hasina","isFavorite":0]
//]

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var quotes = [Quote]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var quoteModel = [QuoteModel]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        quoteModel.append(QuoteModel(quote: "Hi", author: "hello"))
        
//        addItem()
        loadItems()
        tableView.allowsSelection = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as? HomeTableViewCell
        cell?.cellDelegate = self
        cell?.index = indexPath
        cell?.quoteLabel.text = quotes[indexPath.row].quote
        cell?.quoteAuthor.text = quotes[indexPath.row].author
        if quotes[indexPath.row].isFavorite {
            print(quotes[indexPath.row])
            cell?.quoteTopImage.tintColor = UIColor(named: "Color2")
            cell?.favoriteButtonOutlet.tintColor = UIColor.red
            cell?.favoriteButtonOutlet.setImage(#imageLiteral(resourceName: "heartfull"), for: .normal)
            cell?.shareButtonOutlet.tintColor = UIColor(named: "Color2")
        }else{
            cell?.favoriteButtonOutlet.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
            cell?.quoteTopImage.tintColor = UIColor(named: "Color1")
            cell?.favoriteButtonOutlet.tintColor = UIColor(named: "Color1")
            cell?.shareButtonOutlet.tintColor = UIColor(named: "Color1")
        }
        return cell!
    }
    
    
    
    // MARK: - Custome Function
    
    func saveItem() {
        do {
            try context.save()
        } catch {
            print("Error in saving item : \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems(with request : NSFetchRequest<Quote> = Quote.fetchRequest()) {
        
        do {
            quotes = try context.fetch(request)
        } catch {
            print("Error in load item : \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func addItem() {
        let newItem = Quote(context: self.context)
        newItem.quote = "text"
        newItem.author = "false"
        newItem.isFavorite = false
        self.quotes.append(newItem)
    }
}

extension FirstViewController: HomeTableViewCustomCellProtocol,UISearchBarDelegate{

    func onClickFavoriteQuoteProtocolFunc(index: Int) {

//        print("Before Change: \(quotes[index]["isFavorite"] as! Int)")
        if quotes[index].isFavorite == false {
            quotes[index].isFavorite = true
        }else{
            quotes[index].isFavorite = false
        }
        self.tableView.reloadData()
//        print("After Change: \(quotes[index]["isFavorite"] as! Int)")
    }

    func onClickShareQuoteProtocolFunc(index: Int) {
        print("Share Button Clicked at \(index)")
        let item = [quotes[index].quote,"By \(String(describing: quotes[index].author))"]
        let shareSheet = UIActivityViewController(activityItems: item as [Any], applicationActivities: nil)
        self.present(shareSheet, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search terms inserted")
        let request : NSFetchRequest<Quote> = Quote.fetchRequest()
        request.predicate = NSPredicate(format: "quote CONTAINS %@", searchBar.text!)
        
        loadItems(with: request)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0{
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }




}


