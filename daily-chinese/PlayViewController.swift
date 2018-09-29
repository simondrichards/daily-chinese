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

var games = ["game a", "game b", "game c"]
var current_game_score: Int = 8

var current_game: Int = 0

class PlayViewController: UIViewController {
    

    @IBOutlet weak var currentGameScore: UILabel!
    @IBOutlet weak var currentGame: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentGame.text = games[current_game]
        currentGameScore.text = String(current_game_score)
        
        current_game = current_game + 1
        if current_game == games.count {current_game=0}
    }
    

    
  

}
