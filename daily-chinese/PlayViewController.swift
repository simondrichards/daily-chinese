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
import AVFoundation

class PlayViewController: UIViewController {
    
    @IBOutlet weak var currentGameScore: UILabel!
    @IBOutlet weak var currentGame: UILabel!
    @IBOutlet weak var image1: UIImage!
    @IBOutlet weak var image2: UIImage!

    let imageView1 = UIImageView()
    let imageView2 = UIImageView()
    var touchedImage = 0

    let screenSize = UIScreen.main.bounds
    
    var current_game_score: Int = 8
    
    // Dummy data
    var englishSentence = ["this","is","my","red","cup"]
    let chineseSentence = ["这","红色","的","杯子","是","我的"]
    
    // Add some "wrong" words to the English
  //  englishSentence.append("that")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentGame.text = global.games[global.current_game]
        currentGameScore.text = String(current_game_score)
        
        switch global.current_game{
        case 0:
            listeningGame()
        case 1:
            grammarGame()
        case 2:
            translateGame()
        default:
            print("default")
        }
        
        global.current_game = global.current_game + 1
        if global.current_game == global.games.count {global.current_game=0}
        
        // Update total score
        global.current_score += current_game_score
        
    }
    
    func listeningGame() {
        print("listeningGame")
        let testView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        print("w = \(testView.frame.size.width)")
        testView.backgroundColor = .white
        testView.alpha = 1.0
        testView.tag = 100
        testView.isUserInteractionEnabled = true
        self.view.addSubview(testView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenSize.width/2, height: 45))
        label.center = CGPoint(x: screenSize.width/2, y: 0.2*screenSize.height)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Listen to the dialogue and choose the correct picture"
        self.view.addSubview(label)
        
      
        imageView1.image = #imageLiteral(resourceName: "white-plane-sky.png")
        imageView1.frame = CGRect(x: 50, y: screenSize.height/2, width: 150, height: 100)
        imageView1.isUserInteractionEnabled = true
     
        self.view.addSubview(imageView1)
    
    
        imageView2.image = #imageLiteral(resourceName: "highspeedrail")
        imageView2.frame = CGRect(x: 220, y: screenSize.height/2, width: 150, height: 100)
        self.view.addSubview(imageView2)
        
        
   //     playAudio()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        if touch.view == imageView1 {
            print("image 1 touched")
            touchedImage = 1
        }
        if touch.view == imageView2 {
            print("image 2 touched")
            touchedImage = 2
        }
        
    }
    
    func grammarGame() {
        print("grammarGame")
        let testView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        print("w = \(testView.frame.size.width)")
        testView.backgroundColor = .white
        testView.alpha = 1.0
        testView.tag = 100
        testView.isUserInteractionEnabled = true
        self.view.addSubview(testView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenSize.width/2, height: 45))
        label.center = CGPoint(x: screenSize.width/2, y: 0.2*screenSize.height)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Decide whether the sentence is correct"
        self.view.addSubview(label)
    }
    
    func translateGame() {
        print("translateGame")
        let testView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        testView.backgroundColor = .white
        testView.alpha = 1.0
        testView.tag = 100
        testView.isUserInteractionEnabled = true
        self.view.addSubview(testView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenSize.width/2, height: 45))
        label.center = CGPoint(x: screenSize.width/2, y: 0.2*screenSize.height)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Translate the sentence"
        self.view.addSubview(label)
        
        let wordCount = englishSentence.count
        for i in 0..<wordCount {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenSize.width/2, height: 45))
            label.center = CGPoint(x: CGFloat((i+1)*40), y: 0.8*screenSize.height)
            label.textAlignment = .center
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = englishSentence[i]
            self.view.addSubview(label)
        }
        
        let sentence = chineseSentence.joined(separator: " ")
        let sentenceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenSize.width/2, height: 45))
        sentenceLabel.center = CGPoint(x: screenSize.width/2, y: 0.4*screenSize.height)
        sentenceLabel.textAlignment = .center
        sentenceLabel.lineBreakMode = .byWordWrapping
        sentenceLabel.numberOfLines = 0
        sentenceLabel.text = sentence
        self.view.addSubview(sentenceLabel)
        
    }
    
    func removeSubview(){
        print("Start remove subview")
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }else{
            print("No!")
        }
    }
    
    func playAudio() {
        
        var audioPlayer: AVAudioPlayer?
        let path = Bundle.main.path(forResource: "chinesepod_A1287dg.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            print ("Did you hear the dialogue?")
        }
        catch
        { }
    }

    @IBAction func clearView(_ sender: UIButton) {
        removeSubview()
    }
}
