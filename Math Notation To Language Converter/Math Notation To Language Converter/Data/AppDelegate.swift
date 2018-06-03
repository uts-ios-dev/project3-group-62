//
//  AppDelegate.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 10/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //Disabed debug print
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        let model = Dictionary()
        
        //DEV: Examples of Object Retrieval:

        //Retrieve symbol object
        if let symbol = model.getSymbolDataByName(symbolName: "Plus") {
            print("Symbol Object: \n \(symbol) \n")
        } else {
            print("Symbol not found.")
        }

        //Retrieve symbol meaning
        if let symbolMeaning = model.getSymbolDataByName(symbolName: "Plus")?.meaning {
            print("Symbol Meaning: \n \(symbolMeaning) \n")
        }
        //Retrieve symbol translation
        if let symbolTranslation = model.getSymbolDataByName(symbolName: "Plus")?.translation {
            print("Symbol Translation: \n \(symbolTranslation) \n")
        }

        //Retrieve all unique categories (in alphabetical order)
        print("Symbol Categories in model: \n \(model.getSymbolCategories()) \n")

        //Retrieve symbols for a category
        if let symbolArray = model.symbolCategorySetDictionary["Linear Algebra"] {
            print("Sorted Symbol from category: \n \(symbolArray.sorted()) \n")
        } else {
            print("Symbol Array not found")
        }


        //Retrieve formula object
        if let formula = model.getFormulaDataByName(formulaName: "Area of a Square")?.getFormula() {
            print("Formula: \n \(formula) \n")
        } else {
            print("Formula not found.")
        }

        //Retrieve formula description
        if let formulaDescription = model.getFormulaDataByName(formulaName: "Area of a Square")?.description {
            print("Formula Description: \n \(formulaDescription) \n")
        }

        //Retrieve all unique categories (in alphabetical order)
        print("Formula Categories in model: \n \(model.getFormulaCategories()) \n")

        //Retrieve formulas for a category
        if let formulaArray = model.formulaCategorySetDictionary["Geometry"] {
            print("Sorted Formulas from category: \n \(formulaArray.sorted()) \n")
        } else {
            print("Formula Array not found")
        }
        
        
        
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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Math_Notation_To_Language_Converter")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}


