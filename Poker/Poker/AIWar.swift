//
//  AIWar.swift
//  Poker
//
//  Created by Tamara Brey on 5/12/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class AIWar: UIViewController {
    var AIControler = AI()
    
    //AI 1
     //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 chance opponent has a better card
    var AI1Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI1Hand = [Int]()
    var AI1VisableCards = [Int]()
    //AI 2
     //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 chance opponent has a better card
    var AI2Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI2Hand = [Int]()
    var AI2VisableCards = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playOne(_ sender: UIButton) {
        
    }
    @IBAction func playXTimes(_ sender: Any) {
        for _ in 0...100{
            
        }// _ loop end
    }
    
    
    
}
