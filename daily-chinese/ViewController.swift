//
//  ViewController.swift
//  daily-chinese
//
// This is the view controller for the main entry view, showing the current
// statistics, and upcoming lesson and exercise. From here the user accesses
// the settings and launches the next lesson or exercise.
//
//  Created by Simon Richards on 24/09/2018.
//  Copyright © 2018 Simon Richards. All rights reserved.
//

import UIKit

class Global {
    // Declare global variables and initialize them with dummy values for the prototype
    // These will need to be replaced by live data in the full app
    var current_streak: Int = 17
    var personal_best: Int = 24
    var current_level: Int = 8
    var current_score: Int = 1024
    var current_game: Int = 0
    var current_lesson: String = "No Bargaining"
    
    // An initial set of game names - these can be added to later
    var games = ["Listening and comprehension", "Grammar", "Translate (Chinese-English)"]
    
}

let global = Global()

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var currentStreak: UILabel!
    @IBOutlet weak var personalBest: UILabel!
    @IBOutlet weak var currentLevel: UILabel!
    @IBOutlet weak var currentScore: UILabel!
    @IBOutlet weak var nextExercise: UILabel!
    @IBOutlet weak var nextLesson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Provide a custom viewWillAppear to take care of things which need to
    // be updated after the first time the view is loaded
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        currentStreak.text = String(global.current_streak)
        personalBest.text = String(global.personal_best)
        currentLevel.text = String(global.current_level)
        currentScore.text = String(global.current_score)
        nextExercise.text = global.games[global.current_game]
        nextLesson.text = global.current_lesson

    }
}

