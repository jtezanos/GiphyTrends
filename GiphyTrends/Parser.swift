//
//  Parser.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 7/28/16.
//  Copyright © 2016 NA. All rights reserved.
//

import Foundation

class Parser {
    
    func arrayToGIFs(items: [JSONDictionary]) -> [GIF] {
        return items.map {  GIF(gifDict: $0) }
    }
    func trendingAPIResponseToGIFs(JSON: JSONDictionary) -> [GIF] {
        if let dictionaries = JSON[Keys.data] as? [JSONDictionary] {
            return arrayToGIFs(dictionaries)
        }
        
        return [GIF(error: Constants.error)]
    }
}
