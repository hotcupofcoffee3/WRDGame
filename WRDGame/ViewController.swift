//
//  ViewController.swift
//  WRDGame
//
//  Created by Adam Moore on 1/5/18.
//  Copyright © 2018 Adam Moore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lettersDisplayed: [UIButton]!
    
    @IBOutlet var playerLabels: [UIButton]!
    
    @IBAction func backButton(_ sender: UIButton) {
        // Resets all players and scores
        actualPlayers = []
        changeLetters = true
    }
    
    func playerLabelText (atIndex: Int) {
        if actualPlayers[atIndex].name != "" {
            playerLabels[atIndex].setTitle("\(actualPlayers[atIndex].name): \(actualPlayers[atIndex].score)", for: UIControlState.normal)
        } else {
            playerLabels[atIndex].setTitle("", for: UIControlState.normal)
        }
    }
    
    var changeLetters = true
    // Starting number to keep compare for the updatePlayerLabelText to keep it from going to -1 before first letters clicked.
    var pointGivenToThisPlayer = 100
    
    func updatePlayerLabelText (atIndex: Int) {
        if changeLetters == false && actualPlayers[atIndex].name != "" {
            actualPlayers[atIndex].score += 1
            playerLabelText(atIndex: atIndex)
            pointGivenToThisPlayer = atIndex
            changeLetters = true
        } else {
            if atIndex == pointGivenToThisPlayer {
                actualPlayers[pointGivenToThisPlayer].score -= 1
                playerLabelText(atIndex: atIndex)
                changeLetters = false
            }
        }
    }
    
    // Instance of all letters created. The class basically just contains all of the letters added in, according to frequency used in the English language.
    let setupWRDGame = WRDGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // All letters added.
        setupWRDGame.addAllLetters()
        
        // Bottom letters flipped.
        self.lettersDisplayed[1].transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        self.lettersDisplayed[3].transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        self.lettersDisplayed[5].transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        
        
        for playerIndex in 0..<actualPlayers.count {
            playerLabelText(atIndex: playerIndex)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func player1Button(_ sender: UIButton) {
        updatePlayerLabelText(atIndex: 0)
    }
    @IBAction func player2Button(_ sender: UIButton) {
        updatePlayerLabelText(atIndex: 1)
    }
    @IBAction func player3Button(_ sender: UIButton) {
        updatePlayerLabelText(atIndex: 2)
    }
    @IBAction func player4Button(_ sender: UIButton) {
        updatePlayerLabelText(atIndex: 3)
    }
    @IBAction func player5Button(_ sender: UIButton) {
        updatePlayerLabelText(atIndex: 4)
    }
    @IBAction func player6Button(_ sender: UIButton) {
        updatePlayerLabelText(atIndex: 5)
    }
    
    @IBAction func changeLetters(_ sender: UIButton) {
        if changeLetters == true {
            var x = 0
            for _ in 1...3 {
                let randomNum = Int(arc4random_uniform(UInt32(setupWRDGame.letters.count)))
                lettersDisplayed[x].setTitle(setupWRDGame.letters[randomNum], for: UIControlState.normal)
                lettersDisplayed[x+1].setTitle(setupWRDGame.letters[randomNum], for: UIControlState.normal)
                x += 2
            }
            changeLetters = false
        }
        
    }
    
    
    
}
