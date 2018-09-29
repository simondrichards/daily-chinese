//
//  PlayViewController.swift
//  daily-chinese
//
//  This view shows the current game/exercise
//
//  Created by Simon Richards on 29/09/2018.
//  Copyright © 2018 Simon Richards. All rights reserved.
//

import UIKit

var current_game_score: Int = 8

class PlayViewController: UIViewController {
    

    @IBOutlet weak var currentGameScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentGameScore.text = String(current_game_score)
    }
    

    
  

}
