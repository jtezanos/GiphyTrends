//
//  GIF.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 7/28/16.
//  Copyright © 2016 NA. All rights reserved.
//

import Foundation
import CoreData
import UIKit

///  **GIF for all your giffing needs!**
///
///  Properties:
///     - **type:** Will always be .gif (for now)
///     - **images:** JSONDictionary -> [String: AnyObject] that holds various image sizes
///     - **rating:** Results to those rated (y,g, pg, pg-13 or r)
///     - **trendingDateTime:** To determine if .gif has ever trended
///     - **urlForFixedHeight:** Width 568 Height 200

class GIF {
 
    let alamoHandler = AlamoHandler()
    var type = String()
    var images = JSONDictionary()
    var GIFData = NSData()
    var rating = String()
    var trendingDateTime = String()
    var dictionaryForFixedHeight = JSONDictionary()
    var urlForFixedHeightImage = String()
    
    init(gifDict: JSONDictionary) {
        self.type = (gifDict[Keys.type] as? String)!
        self.images = (gifDict[Keys.images] as? JSONDictionary)!
        self.rating = (gifDict[Keys.rating] as? String)!
        self.trendingDateTime = (gifDict[Keys.trendingDateTime] as? String)!
        self.dictionaryForFixedHeight = (self.images[Keys.ImagesKeys.fixedHeight] as? JSONDictionary)!
        self.urlForFixedHeightImage = (self.dictionaryForFixedHeight[Keys.URL] as? String)!
    }
    
    init(error: String) {
        self.type = error
    }
    
    //CB not implemented
//    private func saveData(url: String, data: NSData) {
//        var gifs = [NSManagedObject]()
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        let entity =  NSEntityDescription.entityForName(CD.entityName, inManagedObjectContext:managedContext)
//        let gif = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
//
//        gif.setValue(url, forKey: Keys.URL)
//        gif.setValue(data, forKey: Keys.data)
//        
//        do {
//            try managedContext.save()
//            gifs.append(gif)
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
//    }
    
}
