//
//  WRD Model.swift
//  WRDGame
//
//  Created by Adam Moore on 1/5/18.
//  Copyright © 2018 Adam Moore. All rights reserved.
//

import Foundation

class WRDGame {
    var letters = [String]()
    
    // Add letters to letters array
    func addLetterTypes(times: Int, lettersToAdd: [String]) {
        for _ in 1...times {
            for letter in lettersToAdd {
                letters.append(letter)
            }
        }
    }
    
    func addAllLetters() {
        // Add letters in frequency to 'letters' array
        addLetterTypes(times: 5, lettersToAdd: ["E", "O", "T", "H", "A"])
        addLetterTypes(times: 4, lettersToAdd: ["S", "I", "N", "R", "D"])
        addLetterTypes(times: 3, lettersToAdd: ["L", "U", "Y", "M", "W"])
        addLetterTypes(times: 2, lettersToAdd: ["F", "G", "C", "B", "P"])
        addLetterTypes(times: 1, lettersToAdd: ["K", "V", "J", "Q", "X", "Z"])
    }
    
}
