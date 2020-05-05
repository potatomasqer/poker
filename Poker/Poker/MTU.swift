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
    var backupDeck = [Int]()
    var hand = [Int]()
    var allHandValues = [Int]()
    var AI1hand = [0,0,0,0,0,0]
    var AI1Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func TestStart(_ sender: UIButton) {
        for i in 1...52{
            if i != 0{
            deck.append(i)
            }
        }
        backupDeck = deck
        
        for _ in  0...9999{
            hand = AIController.fullHandDealer(deck: deck, isItGlobal: false)
            AI1Values = AIController.cardRemover(card1: hand[0], card2: hand[1], card3: hand[2], card4: hand[3], card5: hand[4], handValue: AIController.cardValuator(card1: hand[0], card2: hand[1], card3: hand[2], card4: hand[3], card5: hand[4]), visibleCards: [], nessaryValues: AI1Values, needToRemoveCards: true)
            let removalValues = [AI1Values[11]-1,  AI1Values[12]-1, AI1Values[13]-1]
            for i in 0...4{
                let removed = deck.firstIndex(of: hand[i])
                deck.remove(at: removed!)
            }
            for i in 0...2{
                hand[removalValues[i]] = AIController.singleCardDealer(usedDeck: deck, isItGlobal: false)
            }
            let value = modedCardValuator(card1: hand[0], card2: hand[1], card3: hand[2], card4: hand[3], card5: hand[4])
            allHandValues.append(value)
            print(value)
            deck = backupDeck
        }
        for i in 0...allHandValues.count-1{
            print(allHandValues[i])
        }
    }
    func modedCardValuator(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
            
                   let AIC1 = AIController.cardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                   let AIC2 = AIController.cardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                   let AIC3 = AIController.cardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
                   let AIC4 = AIController.cardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
                   let AIC5 = AIController.cardChecker(cardToCheck: card5, card2: card2, card3: card3, card4: card4, card5: card1)
                   
                   let AICValuatorArray = [AIC1, AIC2, AIC3, AIC4, AIC5]
                   var amountOfParedCards = 0

            
            for i in 0...4{
                if AICValuatorArray[i] == 6{
                    //streight flush
                    return 9
                    
                }
                if AICValuatorArray[i] == 5{
                    //quad
                    return 8
                }
                if AICValuatorArray[i] == 4{
                    //flush
                    return 7
                }
                if AICValuatorArray[i] == 3{
                    //streight
                    return 5
                }
                if AICValuatorArray[i] == 2{
                    //tripplet
                    for n in 0...4{
                        if n != i{
                            if AICValuatorArray[n] == 1{
                             //full house
                                return 6
                            }
                            return 4
                        }
                    }
                }
                if AICValuatorArray[i] == 1{
                    //parir
                amountOfParedCards += 1
                }
                //pares
                
                }
            if amountOfParedCards == 4{
                    //dubble pair
                    return 3
                }else if amountOfParedCards == 2{
                    // pair
                    return 2
            }else{
                return 1
        }
        }
    }

