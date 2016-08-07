//
//  GIFViewModel.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 7/31/16.
//  Copyright © 2016 NA. All rights reserved.
//

import Foundation
import UIKit

class GIFViewModel: GIFCellProtocol {
    
    let alamoHandler = AlamoHandler()
    // ~ GIFCellProtocol
    var type = String()
    var images = JSONDictionary()
    var GIFData = NSData()
    var rating = String()
    var trendingDateTime = String()
    var dictionaryForFixedHeight = JSONDictionary()
    var urlForFixedHeightImage = String()
    // ~
    init(GIFAtIndex: GIF){
        self.type = GIFAtIndex.type
        self.images = GIFAtIndex.images
        self.rating = GIFAtIndex.rating
        self.trendingDateTime = GIFAtIndex.trendingDateTime
        self.dictionaryForFixedHeight = GIFAtIndex.dictionaryForFixedHeight
        self.urlForFixedHeightImage = GIFAtIndex.urlForFixedHeightImage
    }

}
