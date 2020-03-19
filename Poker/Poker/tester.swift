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
    
    var AICard1 = 0
    var AICard2 = 0
    var AICard3 = 0
    var AICard4 = 0
    var AICard5 = 0
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
    
    @IBOutlet weak var cardSuit1: UILabel!
    @IBOutlet weak var cardSuit2: UILabel!
    @IBOutlet weak var cardSuit3: UILabel!
    @IBOutlet weak var cardSuit4: UILabel!
    @IBOutlet weak var cardSuit5: UILabel!
    
    
    
    @IBOutlet weak var Card1Value: UILabel!
    @IBOutlet weak var Card2Value: UILabel!
    @IBOutlet weak var Card3Value: UILabel!
    @IBOutlet weak var Card4Value: UILabel!
    @IBOutlet weak var Card5Value: UILabel!
    
    @IBOutlet weak var allCardValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func startGame(_ sender: Any) {
        for i in 1...52{
            if i != 0{
            deck.append(i)
            print(deck[i-1])
            }
        }
        for i in 0...deck.count-1{
        let number = deck.index(after: i-1)
        let removedNumber = deck.remove(at: number)
        deck.append(removedNumber)
        }
        let AICard1Location = Int.random(in: 1...deck.count-1)
        AICard1 = deck.remove(at: AICard1Location)
        
        let AICard2Location = Int.random(in: 1...deck.count-1)
        AICard2 = deck.remove(at: AICard2Location)
        
        let AICard3Location = Int.random(in: 1...deck.count-1)
        AICard3 = deck.remove(at: AICard3Location)
        
        let AICard4Location = Int.random(in: 1...deck.count-1)
        AICard4 = deck.remove(at: AICard4Location)
        
        let AICard5Location = Int.random(in: 1...deck.count-1)
        AICard5 = deck.remove(at: AICard5Location)
        
        
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
        cardNumInSuit2.text = String(AICard2%13)
        cardNumInSuit3.text = String(AICard3%13)
        cardNumInSuit4.text = String(AICard4%13)
        cardNumInSuit5.text = String(AICard5%13)
        
        cardSuit1.text = String((AICard1/13))
        cardSuit2.text = String((AICard2/13))
        cardSuit3.text = String((AICard3/13))
        cardSuit4.text = String((AICard4/13))
        cardSuit5.text = String((AICard5/13))
        
        Card1Value.text = String(card1Value)
        Card2Value.text = String(card2Value)
        Card3Value.text = String(card3Value)
        Card4Value.text = String(card4Value)
        Card5Value.text = String(card5Value)
        
        allCardValue.text = String(AllCardValue)
        
    }
    
        
    
    

    

}
