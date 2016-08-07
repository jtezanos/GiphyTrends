//
//  NavigationController.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 8/4/16.
//  Copyright © 2016 NA. All rights reserved.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        self.navigationBar.barStyle = UIBarStyle.Black
        self.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationBar.translucent = false
    }
}