//
//  ViewController.swift
//  daily-chinese
//
//  Created by Simon Richards on 24/09/2018.
//  Copyright © 2018 Simon Richards. All rights reserved.
//

import UIKit

// Declare variables and initialize them with dummy values for the prototype
// These will need to be replaced by live data in the full app
var current_streak: Int = 17
var personal_best: Int = 24
var current_level: Int = 8
var current_score: Int = 1024




class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var currentStreak: UILabel!
    @IBOutlet weak var personalBest: UILabel!
    @IBOutlet weak var currentLevel: UILabel!
    @IBOutlet weak var currentScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentStreak.text = String(current_streak)
        personalBest.text = String(personal_best)
        currentLevel.text = String(current_level)
        currentScore.text = String(current_score)
        
        
    }
}

