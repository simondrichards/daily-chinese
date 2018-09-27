//
//  OptionsViewController.swift
//  daily-chinese
//
//  This view controller is for the settings. Here the user provides their
//  ChinesePod login to link the app to their ChinesePod account in order
//  to access content.
//
//  Created by Simon Richards on 25/09/2018.
//  Copyright © 2018 Simon Richards. All rights reserved.
//

import UIKit
import MultiSelectSegmentedControl

class OptionsViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var selectHSKLevels: MultiSelectSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
