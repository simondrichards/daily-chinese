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
    var resultLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    var currentScoreLabel = UILabel()
    var englishWords = [String]()
    var xposWord = CGFloat(0)
    var iword = 0
    var correctCount = 0
    var correctTranslation = true

    let screenSize = UIScreen.main.bounds
    
    var current_game_score: Int = 8
    
    // Dummy data
    var englishSentence = ["this","red","cup","is","mine"]
    let chineseSentence = ["这","红色","的","杯子","是","我的"]
    
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

        // Update total score
        global.current_score += current_game_score

    }
    
    func listeningGame() {
        let testView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        testView.backgroundColor = .white
        testView.alpha = 1.0
        testView.tag = 100
        testView.isUserInteractionEnabled = true
        self.view.addSubview(testView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenSize.width/2, height: 45))
        label.center = CGPoint(x: screenSize.width/2, y: 0.3*screenSize.height)
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
        imageView2.isUserInteractionEnabled = true
        self.view.addSubview(imageView2)
        
        resultLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        resultLabel.center = CGPoint(x: screenSize.width/2, y: 0.7*screenSize.height)
        resultLabel.text = ""
        self.view.addSubview(resultLabel)
        
        currentScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        currentScoreLabel.center = CGPoint(x: screenSize.width/2, y: 0.2*screenSize.height)
        currentScoreLabel.text = "Score: \(current_game_score)"
        self.view.addSubview(currentScoreLabel)
        
   //     playAudio()
    }

    
    func grammarGame() {
        let testView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        testView.backgroundColor = .white
        testView.alpha = 1.0
        testView.tag = 100
        testView.isUserInteractionEnabled = true
        self.view.addSubview(testView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenSize.width/2, height: 100))
        label.center = CGPoint(x: screenSize.width/2, y: 0.2*screenSize.height)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.text = "Decide whether the sentence is correct (Not yet implemented)"
        self.view.addSubview(label)
    }
    
    func translateGame() {
        
        // Add some "wrong" words to the English
        correctCount = englishSentence.count
        englishSentence += ["that", "those", "green", "his", "hat", "which", "black"]
        
        englishWords = englishSentence
        englishWords.shuffle()
        
        xposWord = CGFloat(50)
        iword = 0
        correctTranslation = true
        
        let testView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        testView.backgroundColor = .white
        testView.alpha = 1.0
        testView.tag = 100
        testView.isUserInteractionEnabled = true
        self.view.addSubview(testView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenSize.width/2, height: 45))
        label.center = CGPoint(x: screenSize.width/2, y: 0.3*screenSize.height)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Translate the sentence"
        self.view.addSubview(label)
        
        let wordCount = englishWords.count
        for i in 0..<wordCount {
            var xpos = CGFloat((i+1)*60)
            var ypos = 0.8*screenSize.height
            if i>5{
                xpos -= 6*60
                ypos += 55
            }
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
            label.center = CGPoint(x: xpos, y: ypos)
            label.textAlignment = .center
            label.backgroundColor = .cyan
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.text = englishWords[i]
            label.isUserInteractionEnabled = true
            label.tag = 1000+i
            self.view.addSubview(label)
        }
        
        resultLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        resultLabel.center = CGPoint(x: screenSize.width/2, y: 0.7*screenSize.height)
        resultLabel.text = "Select the correct words"
        self.view.addSubview(resultLabel)
        
        let sentence = chineseSentence.joined(separator: " ")
        let sentenceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenSize.width/2, height: 45))
        sentenceLabel.center = CGPoint(x: screenSize.width/2, y: 0.4*screenSize.height)
        sentenceLabel.textAlignment = .left
        sentenceLabel.lineBreakMode = .byWordWrapping
        sentenceLabel.numberOfLines = 0
        sentenceLabel.text = sentence
        self.view.addSubview(sentenceLabel)
        
        currentScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        currentScoreLabel.center = CGPoint(x: screenSize.width/2, y: 0.2*screenSize.height)
        currentScoreLabel.text = "Score: \(current_game_score)"
        self.view.addSubview(currentScoreLabel)
        
    
        
    }
    
    func removeSubview(){
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }else{
            return
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
        }
        catch
        { }
    }

    @IBAction func clearView(_ sender: UIButton) {
        removeSubview()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let ypos = screenSize.height/2
        
        switch (global.current_game){
        case 0:
            if touch.view == imageView1 {
                touchedImage = 1
                resultLabel.text = "Correct"
                current_game_score += 1
                currentScoreLabel.text = "Score: \(current_game_score)"
            }
            if touch.view == imageView2 {
                touchedImage = 2
                resultLabel.text = "Incorrect"
            }
        case 2:
            if correctTranslation && iword==correctCount {return}
            if iword>correctCount-1 || !correctTranslation {
                resultLabel.text = "Incorrect"
                resultLabel.backgroundColor = .red
                return
            }
            for i in 0..<englishSentence.count {
                if touch.view!.tag == 1000+i {
                    xposWord += CGFloat(50)
            
                    let answerWord = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
                    answerWord.center = CGPoint(x: xposWord, y: ypos)
                    answerWord.text = englishWords[i]
                    answerWord.backgroundColor = .orange
                    if answerWord.text == englishSentence[iword] {
                        answerWord.backgroundColor = .green
                    }
                    else {
                        answerWord.backgroundColor = .red
                        correctTranslation = false
                        resultLabel.text = "Incorrect"
                        resultLabel.backgroundColor = .red
                        resultLabel.textAlignment = .center
                    }
                    self.view.addSubview(answerWord)
                    if correctTranslation && iword == correctCount-1 {
                        resultLabel.text = "Correct"
                        resultLabel.backgroundColor = .green
                        resultLabel.textAlignment = .center
                        current_game_score += 1
                        currentScoreLabel.text = "Score: \(current_game_score)"
                    }
                    iword += 1
                }
            }
        default:
            print("default")
        }
    }
    
}
