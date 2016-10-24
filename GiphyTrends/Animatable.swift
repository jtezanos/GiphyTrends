//
//  Animatable.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 8/6/16.
//  Copyright © 2016 NA. All rights reserved.
//

import Foundation
import UIKit

protocol Animatable {    }

extension Animatable where Self: UICollectionViewCell {
    
    func animateCellDisplay(row: Int, viewController: UIViewController) {
        let originX = self.frame.origin.x
        if row % 2 == 0 {
            self.frame.origin.x = -self.frame.width
        } else {
            self.frame.origin.x = viewController.view.frame.width
        }
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.frame.origin.x = originX
        }), completion: nil)
    }
    
}
extension UICollectionViewCell: Animatable { }