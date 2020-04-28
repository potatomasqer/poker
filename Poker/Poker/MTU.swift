//
//  MTU.swift
//  Poker
//
//  Created by Tamara Brey on 4/28/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class MTU: UIViewController {
    var AIController = AI()
    var deck = [Int]()
    var hand = [0,0,0,0,0,0]
    var avarage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func TestStart(_ sender: UIButton) {
        for i in 1...52{
            if i != 0{
            deck.append(i)
            }
        }
        for _ in  0...9999{
            hand[0] = AIController.singleCardDealer(usedDeck: deck, isItGlobal: true)
            hand[1] = AIController.singleCardDealer(usedDeck: deck, isItGlobal: true)
            hand[2] = AIController.singleCardDealer(usedDeck: deck, isItGlobal: true)
            hand[3] = AIController.singleCardDealer(usedDeck: deck, isItGlobal: true)
            hand[4] = AIController.singleCardDealer(usedDeck: deck, isItGlobal: true)
            
            avarage += AIController.cardValuator(card1: hand[0], card2: hand[1], card3: hand[2], card4: hand[3], card5: hand[4])
            
            print(avarage)
        }
        print(avarage/10000)
        avarage = 0
    }
    

}
