//
//  FiveCard.swift
//  Poker
//
//  Created by period4 on 2/11/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class FiveCard: UIViewController {
    //univircial varables
    var aiControler = AI()
    var gameDeck = [Int]()
    var numberOfPlayers = 2
    var whatTurnIsIt = 1
    var whatRoundIsIt = 1
    //local varables
    //human player
    //cards
    var hCard1 = 0
    var hCard2 = 0
    var hCard3 = 0
    var hCard4 = 0
    var hCard5 = 0
    var hHand = [Int]()
    //choice
    //1 fold 2 call 3 raise
    var hChoice = 0
    
    //AI's max of 6 AI's
    //AI 1
    //cards
    var AI1Card1 = 0
    var AI1Card2 = 0
    var AI1Card3 = 0
    var AI1Card4 = 0
    var AI1Card5 = 0
    var AI1Hand = [Int]()
    
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 chance opponent has a better card
    var AI1Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI1VisableCards = [Int]()
    
    //AI 2
    var AI2Card1 = 0
    var AI2Card2 = 0
    var AI2Card3 = 0
    var AI2Card4 = 0
    var AI2Card5 = 0
    var AI2Hand = [Int]()
    
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 chance opponent has a better card
    var AI2Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI2VisableCards = [Int]()

    //AI 3
    var AI3Card1 = 0
    var AI3Card2 = 0
    var AI3Card3 = 0
    var AI3Card4 = 0
    var AI3Card5 = 0
    var AI3Hand = [Int]()
    
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 chance opponent has a better card
    var AI3Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI3VisableCards = [Int]()

    //AI 4
    var AI4Card1 = 0
    var AI4Card2 = 0
    var AI4Card3 = 0
    var AI4Card4 = 0
    var AI4Card5 = 0
    var AI4Hand = [Int]()
    
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 chance opponent has a better card
    var AI4Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI4VisableCards = [Int]()

    //AI 5
    var AI5Card1 = 0
    var AI5Card2 = 0
    var AI5Card3 = 0
    var AI5Card4 = 0
    var AI5Card5 = 0
    var AI5Hand = [Int]()
    
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 chance opponent has a better card
    var AI5Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI5VisableCards = [Int]()

    //outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //seting up deck
        for i in 1...52{
            gameDeck.append(i)
        }
        //deal the cards
        hHand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
        gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        if numberOfPlayers == 2{
            AI1Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        }else if numberOfPlayers == 3{
            AI1Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
            
            AI2Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        }else if numberOfPlayers == 4{
            AI1Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
            
            AI2Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
            
            AI3Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        }else if numberOfPlayers == 5{
            AI1Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
            
            AI2Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
            
            AI3Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
            
            AI4Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        }else if numberOfPlayers == 6{
            AI1Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
            
            AI2Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
            
            AI3Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
            
            AI4Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
            
            AI5Hand.append(contentsOf: aiControler.fullHandDealer(deck: gameDeck, isItGlobal: true))
            gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        }
         AI1Card1 = AI1Hand[0]
         AI1Card2 = AI1Hand[1]
         AI1Card3 = AI1Hand[2]
         AI1Card4 = AI1Hand[3]
         AI1Card5 = AI1Hand[4]
        
         AI2Card1 = AI2Hand[0]
         AI2Card2 = AI2Hand[1]
         AI2Card3 = AI2Hand[2]
        AI2Card4 = AI2Hand[3]
         AI2Card5 = AI2Hand[4]
        
        AI3Card1 = AI3Hand[0]
        AI3Card2 = AI3Hand[1]
        AI3Card3 = AI3Hand[2]
        AI3Card4 = AI3Hand[3]
        AI3Card5 = AI3Hand[4]
        
        AI4Card1 = AI4Hand[0]
        AI4Card2 = AI4Hand[1]
        AI4Card3 = AI4Hand[2]
        AI4Card4 = AI4Hand[3]
        AI4Card5 = AI4Hand[4]
        
        AI5Card1 = AI5Hand[0]
        AI5Card2 = AI5Hand[1]
        AI5Card3 = AI5Hand[2]
        AI5Card4 = AI5Hand[3]
        AI5Card5 = AI5Hand[4]
    }
    @IBAction func gameStart(_ sender: UIButton) {
        for i in 1...numberOfPlayers{
            // 1 human 2 ai1 3 ai2...
            
        }
    }
    
    
    
}
