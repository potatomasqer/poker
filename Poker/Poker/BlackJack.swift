//
//  BlackJack.swift
//  Poker
//
//  Created by period4 on 2/11/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class BlackJack: UIViewController {
    
    //gamplay
    var numberOfPeople = 0
    var currentPot = 0
    var startingCash = 0
    
    var PMove = 0
    var AI1Move = 0
    var AI2Move = 0
    var AI3Move = 0
    var AI4Move = 0
    var AI5Move = 0
    
    
    
    //human player
    var PCard1 = 0
    var PCard2 = 0
    var PCard3 = 0
    var PCard4 = 0
    var PCard5 = 0
    var PBetAmount = 0
    var PAmountStored = 0
    
    //AI stuff
        //AI 1
    var AI1Card1 = 0
    var AI1Card2 = 0
    var AI1Card3 = 0
    var AI1Card4 = 0
    var AI1Card5 = 0
    
    
    
    
    
    
        //AI 2
    
    
        //AI 3
    
        //AI 4
    
        //AI 5
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfPeople = UserDefaults.standard.integer(forKey: "people")
        
    }

    
        
}
