//
//  Extensions.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 7/29/16.
//  Copyright © 2016 NA. All rights reserved.
//

import Foundation
import UIKit
import Gifu

extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}

//MARK: - UIImageView Extension
extension AnimatableImageView {
    public func gifFromUrl(urlString: String, completion: () -> Void) {
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "GET"
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                if let imageData = data as NSData? {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.animateWithImageData(imageData)
                    }
                }
            })
        task.resume()
        completion()
    }
}

