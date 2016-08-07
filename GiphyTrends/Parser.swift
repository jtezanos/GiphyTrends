//
//  Parser.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 7/28/16.
//  Copyright © 2016 NA. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

class Parser {
    
    func arrayToGIFs(items: [JSONDictionary]) -> [GIF] {
        if Defaults[.familyFriendlyStatus] == true {
            print("⚠️ MAP FILTER")
            return items.map {  GIF(gifDict: $0) }.filter { $0.rating != "r" }.filter { $0.rating != "pg-13" }
        } else {
            return items.map {  GIF(gifDict: $0) }
        }
    }
    func trendingAPIResponseToGIFs(JSON: JSONDictionary) -> [GIF] {
        if let dictionaries = JSON[Keys.data] as? [JSONDictionary] {
            return arrayToGIFs(dictionaries)
        }
        
        return [GIF(error: Constants.error)]
    }

}
