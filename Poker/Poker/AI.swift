//
//  AI.swift
//  Poker
//
//  Created by period4 on 2/21/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit
import CoreML



class AI {
    
    //initilizing stuff
    var AICards = [Int]()
    var endChoice = 0
    var deck = [Int]()
    init() {
        AICards  = [0,0,0,0,0]
        endChoice = 0
    }
    init(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int) {
        AICards = [card1,card2,card3,card4,card5]
        endChoice = 0
    }
    
    func cardValuator(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
        let AIC1 = cardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
        let AIC2 = cardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
        let AIC3 = cardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
        let AIC4 = cardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
        let AIC5 = cardChecker(cardToCheck: card5, card2: card2, card3: card3, card4: card4, card5: card1)
        
        let AICValuatorArray = [AIC1, AIC2, AIC3, AIC4, AIC5]
        var amountOfParedCards = 0
        print("card valuation")
        print(AICValuatorArray)

        if card5 != 0 {
            
            
            for i in 0...4{
                print(i, AICValuatorArray[i])
                if AICValuatorArray[i] == 6{
                    //streight flush
                    return 8
                    
                }
                if AICValuatorArray[i] == 5{
                    //quad
                    return 7
                }
                if AICValuatorArray[i] == 4{
                    //flush
                    return 5
                }
                if AICValuatorArray[i] == 3{
                    //streight
                    return 4
                }
                if AICValuatorArray[i] == 2{
                    //tripplet
                    for n in 0...4{
                        if n != i{
                            if AICValuatorArray[n] == 1{
                             //full house
                                return 6
                            }
                            return 3
                        }
                    }
                }
                if AICValuatorArray[i] == 1{
                    //parir
                amountOfParedCards += 1
                }
                //pares
                if amountOfParedCards == 4{
                    //dubble pair
                    return 2
                }else if amountOfParedCards == 1{
                    // pair
                    return 1
                }
            }
        }else{
        //cards are useless
            print("failed")
        return 0
        }
        //failed to count cards? or cards amount below 2
        print("failed")
        return 0
    }

        
    
    
    
    
    
    
    
    
    
    
    
    
    func cardChecker(cardToCheck: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
        AICards.removeAll()
        AICards.append(contentsOf: [cardToCheck, card2, card3, card4, card5])
        AICards.sort()
        let card1Location = AICards.firstIndex(of: cardToCheck)
            //arrays
            let AIHandNumbers = [AICards[0]%13, AICards[1]%13, AICards[2]%13,AICards[3]%13,AICards[4]%13]
            let AISuitNumbers =   [AICards[0]/13, AICards[1]/13, AICards[2]/13,AICards[3]/13,AICards[4]/13]
            print(AIHandNumbers)
            //importent varables
            var amountPairedWith = 0
            var foundStraight = false
            var amountFlushedWith = 0
            
            print("card Location",card1Location!)

            for i in 0...4{
                //only caounts if it is not compariong to itself
                
                if i != card1Location{
                    
                    if cardToCheck == AIHandNumbers[i]{
                        //number of cards with the same number
                        // findes pares, triplits and quads
                        amountPairedWith += 1
                        print("paired",amountPairedWith, i)
                    }
                    if cardToCheck/4 == AISuitNumbers[i]{
                        //number of cards in the same suit
                        //trys to find a flush
                        amountFlushedWith += 1
                    }
                    
                    if  AIHandNumbers[0]-1 == AIHandNumbers[1] && AIHandNumbers[1]-1 == AIHandNumbers[2] && AIHandNumbers[2]-1 == AIHandNumbers[3] && AIHandNumbers[3]-1 == AIHandNumbers[4]{
                        //findes straight
                        foundStraight = true
                    }
                    
                    
                }
                // results to return
                if amountPairedWith == 3{
                    //quad
                    return 5
                }
                
                if foundStraight == true && amountFlushedWith == 4{
                    //straight flush
                    return 6
                }else if amountFlushedWith == 4{
                    //flush
                    return 4
                }else if foundStraight == true{
                    //straight
                    return 3
                }
                if amountPairedWith == 2{
                    //triplet
                    return 2
                }
                if amountPairedWith == 1{
                    return 1
                }
                if amountPairedWith == 0{
                    print("useless",i, amountPairedWith)
                }
            }
        print("failed/useless")
        return 0
        }
            

    // card evaluating
    func AI(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int, AllIn: Bool, roundsPlayed: Int )-> Int{
        // func inside func
        AICards = [card1, card2, card3, card4, card5]
        AICards.sort()
        
                
                
        return endChoice
        
    }
    
    
}
