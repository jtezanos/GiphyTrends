//
//  SettingsViewController.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 8/6/16.
//  Copyright © 2016 NA. All rights reserved.
//

import Foundation
import UIKit
import SwiftyUserDefaults

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var familyFriendlySwitch: UISwitch!
    
    @IBAction func closeSettingsPress(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { 
            
        }
    }
    
    @IBAction func familySearchToggle(familyFriendlySwitch: UISwitch) {
        if familyFriendlySwitch.on {
            Defaults[.familyFriendlyStatus] = true
        } else {
            Defaults[.familyFriendlyStatus] = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkFamilyFriendlyStatus()
    }
    
    func checkFamilyFriendlyStatus() {
        if Defaults[.familyFriendlyStatus] == true {
            familyFriendlySwitch.setOn(true, animated: false)
        } else {
            familyFriendlySwitch.setOn(false, animated: false)
        }
    }
}
