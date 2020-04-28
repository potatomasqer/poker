//
//  tester.swift
//  Poker
//
//  Created by Tamara Brey on 3/19/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class tester: UIViewController {
    //varibles
    var AIController = AI()
    var deck = [Int]()
    var nessaryValues = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    var AICard1 = 0
    var AICard2 = 0
    var AICard3 = 0
    var AICard4 = 0
    var AICard5 = 0
    var AIHand = [Int]()
    //outlets
    @IBOutlet weak var actualCardNum1: UILabel!
    @IBOutlet weak var actualCardNum2: UILabel!
    @IBOutlet weak var actualCardNum3: UILabel!
    @IBOutlet weak var actualCardNum4: UILabel!
    @IBOutlet weak var actualCardNum5: UILabel!
    
    @IBOutlet weak var cardNumInSuit1: UILabel!
    @IBOutlet weak var cardNumInSuit2: UILabel!
    @IBOutlet weak var cardNumInSuit3: UILabel!
    @IBOutlet weak var cardNumInSuit4: UILabel!
    @IBOutlet weak var cardNumInSuit5: UILabel!
    
    @IBOutlet weak var nCard1: UILabel!
    @IBOutlet weak var nCard2: UILabel!
    @IBOutlet weak var nCard3: UILabel!
    @IBOutlet weak var nCard4: UILabel!
    @IBOutlet weak var nCard5: UILabel!
    
    @IBOutlet weak var nScore: UILabel!
    
    @IBOutlet weak var Card1Value: UILabel!
    @IBOutlet weak var Card2Value: UILabel!
    @IBOutlet weak var Card3Value: UILabel!
    @IBOutlet weak var Card4Value: UILabel!
    @IBOutlet weak var Card5Value: UILabel!
    
    @IBOutlet weak var allCardValue: UILabel!
    
    @IBOutlet weak var cardToRemove1: UILabel!
    @IBOutlet weak var cardToRemove2: UILabel!
    @IBOutlet weak var cardToRemove3: UILabel!
    
    @IBOutlet weak var desiredScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func startGame(_ sender: Any) {
        deck.removeAll()
        for i in 1...52{
            if i != 0{
            deck.append(i)
            }
        }
        let defaults = UserDefaults.standard
        defaults.set(deck, forKey: "GlobalDeck")
        print("deck duping check", deck.count)
        
        AICard1 = AIController.singleCardDealer(usedDeck: deck, isItGlobal: true)
        deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        AICard2 = AIController.singleCardDealer(usedDeck: deck, isItGlobal: true)
        deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        AICard3 = AIController.singleCardDealer(usedDeck: deck, isItGlobal: true)
        deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        AICard4 = AIController.singleCardDealer(usedDeck: deck, isItGlobal: true)
        deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        AICard5 = AIController.singleCardDealer(usedDeck: deck, isItGlobal: true)
        deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        
        
        //Ai functions
        let card1Value = AIController.cardChecker(cardToCheck: AICard1, card2: AICard2, card3: AICard3, card4: AICard4, card5: AICard5)
        let card2Value = AIController.cardChecker(cardToCheck: AICard2, card2: AICard1, card3: AICard3, card4: AICard4, card5: AICard5)
        let card3Value = AIController.cardChecker(cardToCheck: AICard3, card2: AICard2, card3: AICard1, card4: AICard4, card5: AICard5)
        let card4Value = AIController.cardChecker(cardToCheck: AICard4, card2: AICard2, card3: AICard3, card4: AICard1, card5: AICard5)
        let card5Value = AIController.cardChecker(cardToCheck: AICard5, card2: AICard2, card3: AICard3, card4: AICard4, card5: AICard1)
        
        let AllCardValue = AIController.cardValuator(card1: AICard1, card2: AICard2, card3: AICard3, card4: AICard4, card5: AICard5)
        
        
        actualCardNum1.text = String(AICard1)
        actualCardNum2.text = String(AICard2)
        actualCardNum3.text = String(AICard3)
        actualCardNum4.text = String(AICard4)
        actualCardNum5.text = String(AICard5)
        
        cardNumInSuit1.text = String(AICard1%13)
        if cardNumInSuit1.text! == "0" {cardNumInSuit1.text = "13"}
        cardNumInSuit2.text = String(AICard2%13)
        if cardNumInSuit2.text! == "0" {cardNumInSuit2.text = "13"}
        cardNumInSuit3.text = String(AICard3%13)
        if cardNumInSuit3.text! == "0" {cardNumInSuit3.text = "13"}
        cardNumInSuit4.text = String(AICard4%13)
        if cardNumInSuit4.text! == "0" {cardNumInSuit4.text = "13"}
        cardNumInSuit5.text = String(AICard5%13)
        if cardNumInSuit5.text! == "0" {cardNumInSuit5.text = "13"}
        
        
        Card1Value.text = String(card1Value)
        Card2Value.text = String(card2Value)
        Card3Value.text = String(card3Value)
        Card4Value.text = String(card4Value)
        Card5Value.text = String(card5Value)
        
        allCardValue.text = String(AllCardValue)
     
        
        nessaryValues = AIController.cardRemover(card1: AICard1, card2: AICard2, card3: AICard3, card4: AICard4, card5: AICard5, handValue: AllCardValue, visibleCards: [], nessaryValues: nessaryValues, needToRemoveCards: true)
        print("duping check",nessaryValues, nessaryValues.count)
        cardToRemove1.text = String(nessaryValues[11])
        cardToRemove2.text = String(nessaryValues[12])
        cardToRemove3.text = String(nessaryValues[13])
        
        desiredScore.text = String(nessaryValues[14])
        
        var hand = [AICard1,AICard2,AICard3,AICard4,AICard5]
        let removalValues = [nessaryValues[11]-1, nessaryValues[12]-1, nessaryValues[13]-1]
        for i in 0...2{
            hand[removalValues[i]] = AIController.singleCardDealer(usedDeck: deck, isItGlobal: true)
            deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        } 
        
        nCard1.text = String(hand[0]%13)
         if nCard1.text! == "0" {nCard1.text = "13"}
        nCard2.text = String(hand[1]%13)
        if nCard2.text! == "0" {nCard2.text = "13"}
        nCard3.text = String(hand[2]%13)
        if nCard3.text! == "0" {nCard3.text = "13"}
        nCard4.text = String(hand[3]%13)
        if nCard4.text! == "0" {nCard4.text = "13"}
        nCard5.text = String(hand[4]%13)
        if nCard5.text! == "0" {nCard5.text = "13"}
        
        nScore.text = String(AIController.cardValuator(card1: hand[0], card2: hand[1], card3: hand[2], card4: hand[3], card5: hand[4]))
    }
}
