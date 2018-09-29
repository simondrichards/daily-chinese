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

class PlayViewController: UIViewController {
    
    @IBOutlet weak var currentGameScore: UILabel!
    @IBOutlet weak var currentGame: UILabel!
    
    var current_game_score: Int = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentGame.text = global.games[global.current_game]
        currentGameScore.text = String(current_game_score)
        
        global.current_game = global.current_game + 1
        if global.current_game == global.games.count {global.current_game=0}
        
        // Update total score
        global.current_score += current_game_score
    }
    

    
  

}
