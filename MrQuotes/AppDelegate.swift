//
//  AppDelegate.swift
//  MrQuotes
//
//  Created by Yasin Shamrat on 21/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        preloadData()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    private func preloadData(){
        let userDefault = UserDefaults.standard
        if userDefault.bool(forKey: "isPreloaded") == false {
            print("inserting data.")
            let data = [
                ["quote":"The greatest glory in living lies not in never falling, but in rising every time we fall.","author":"Nelson Mendela","isFavorite":false],
                ["quote":"The way to get started is to quit talking and begin doing.","author":"Walt Disney","isFavorite":false],
                ["quote":"Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking.","author":"Steve Jobs","isFavorite":false],
                ["quote":"If life were predictable it would cease to be life, and be without flavor.","author":"Eleanor Roosevelt","isFavorite":false],
                ["quote":"If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough.","author":"Oprah Winfrey","isFavorite":false],
                ["quote":"If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success.","author":"James Cameroon","isFavorite":false],
                ["quote":"Life is what happens when you're busy making other plans.","author":"John Lennon","isFavorite":false],
                ["quote":"Spread love everywhere you go. Let no one ever come to you without leaving happier.","author":"Mother Teresa","isFavorite":false],
                ["quote":"When you reach the end of your rope, tie a knot in it and hang on.","author":"Franklin D. Roosevelt","isFavorite":false],
                ["quote":"Always remember that you are absolutely unique. Just like everyone else.","author":"Margaret Mead","isFavorite":false],
                ["quote":"Don't judge each day by the harvest you reap but by the seeds that you plant.","author":"Robert Louis Stevenson","isFavorite":false],
                ["quote":"Whoever is happy will make others happy too.","author":"Anna Frank","isFavorite":false]
            ]
            let backgroundContext = persistentContainer.newBackgroundContext()
            
            do {
                for single in data{
                    let quote = Quote(context: backgroundContext)
                    quote.quote = single["quote"]! as? String
                    quote.author = single["author"]! as? String
                    quote.isFavorite = single["isFavorite"]! as! Bool
                    try backgroundContext.save()
                }
                userDefault.set(true, forKey: "isPreloaded")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

