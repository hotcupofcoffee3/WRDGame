//
//  WRDGameSetup.swift
//  WRDGame
//
//  Created by Adam Moore on 1/5/18.
//  Copyright © 2018 Adam Moore. All rights reserved.
//

import UIKit

class Player {
    var name: String = ""
    var score: Int = 0
    init(name: String){
        self.name = name
    }
}

var actualPlayers = [Player]()

class WRDGameSetup: UIViewController, UITextFieldDelegate {

    @IBOutlet var playerNames: [UITextField]!
    
    @IBAction func addNewPlayerNames(_ sender: UIButton) {
        // Add players, with "" as default if no value given.
        for player in playerNames {
            if player.text != ""{
                actualPlayers.append(Player(name: player.text!))
            }
        }
        while actualPlayers.count < 6 {
            actualPlayers.append(Player(name: ""))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for playerName in playerNames {
            playerName.delegate = self
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for playerName in playerNames {
            playerName.resignFirstResponder()
        }
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
