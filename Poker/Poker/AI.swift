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
    
    
    //DO NOT SORT
    // location of stuff
    //0...4 cards, 5...9 card values, 10 hand value, 11...12 cards to trade in, 13 chance opponent has a better card
    var nessaryValues = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    
    init() {
        AICards  = [0,0,0,0,0]
        endChoice = 0
         nessaryValues = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    }
    init(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int) {
        AICards = [card1,card2,card3,card4,card5]
        endChoice = 0
    }
    //individual functions
    
    //checks all cards against all other cards
    func cardValuator(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
        print("card valuation")
        print("card valuation")
        print("card valuation")
        print("card valuation")
        print("card valuation")
       
        if card5 != 0 {
            
            let AIC1 = cardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                   let AIC2 = cardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                   let AIC3 = cardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
                   let AIC4 = cardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
                   let AIC5 = cardChecker(cardToCheck: card5, card2: card2, card3: card3, card4: card4, card5: card1)
                   
                   let AICValuatorArray = [AIC1, AIC2, AIC3, AIC4, AIC5]
                   var amountOfParedCards = 0
                   
                   print("5 cards",AICValuatorArray)
            
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
                print("paired", amountOfParedCards)
                }
                //pares
                
                }
            if amountOfParedCards == 4{
                    //dubble pair
                    return 2
                }else if amountOfParedCards == 2{
                    // pair
                    return 1
            }
        }else if card4 != 0 {
                
                let AIC1 = cardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                       let AIC2 = cardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                       let AIC3 = cardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
                       let AIC4 = cardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
            
                       let AICValuatorArray = [AIC1, AIC2, AIC3, AIC4]
            
                       var amountOfParedCards = 0
                       
                       print("4 cards",AICValuatorArray)
                
                for i in 0...3{
                    print(i, AICValuatorArray[i])
                    if AICValuatorArray[i] == 6{
                        //streight flush
                        return 7
                        
                    }
                    if AICValuatorArray[i] == 5{
                        //quad
                        return 6
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
                        return 3
                    }
                    if AICValuatorArray[i] == 1{
                        //parir
                    amountOfParedCards += 1
                    print("paired", amountOfParedCards)
                    }
                    //pares
                    
                    }
                if amountOfParedCards == 4{
                        //dubble pair
                        return 2
                    }else if amountOfParedCards == 2{
                        // pair
                        return 1
                }
            }else if card3 != 0 {
                
                let AIC1 = cardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                       let AIC2 = cardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                       let AIC3 = cardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
                       
                       let AICValuatorArray = [AIC1, AIC2, AIC3,]
                       var amountOfParedCards = 0
                       
                       print("3 cards",AICValuatorArray)
                
                for i in 0...2{
                    print(i, AICValuatorArray[i])
                    if AICValuatorArray[i] == 6{
                        //streight flush
                        return 4
                        
                    }
                    if AICValuatorArray[i] == 4{
                        //flush
                        return 3
                    }
                    if AICValuatorArray[i] == 3{
                        //streight
                        return 2
                    }
                    if AICValuatorArray[i] == 1{
                        //parir
                    amountOfParedCards += 1
                    print("paired", amountOfParedCards)
                    }
                    //pares
                    
                    }
                if amountOfParedCards == 2{
                        // pair
                        return 1
                }
            }else if card2 != 0 {
                
                let AIC1 = cardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                let AIC2 = cardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                       
                       let AICValuatorArray = [AIC1, AIC2]
                       var amountOfParedCards = 0
                       
                       print("2 card",AICValuatorArray)
                
                for i in 0...4{
                    print(i, AICValuatorArray[i])
                    if AICValuatorArray[i] == 6{
                        //streight flush
                        return 4
                        
                    }
                   
                    if AICValuatorArray[i] == 4{
                        //flush
                        return 3
                    }
                    if AICValuatorArray[i] == 3{
                        //streight
                        return 2
                    }
                    if AICValuatorArray[i] == 1{
                        //parir
                    amountOfParedCards += 1
                    print("paired", amountOfParedCards)
                    }
                    //pares
                    
                    }
               if amountOfParedCards == 2{
                        // pair
                        return 1
                }
            }
        //failed to count cards? or cards amount below 2
        print("failed")
        return 0
    }

        
    
    
    
    
    
    
    
    
    
    
    
    //checks card against all other cards
    func cardChecker(cardToCheck: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
        AICards.removeAll()
        AICards.append(contentsOf: [card2, card3, card4, card5])
        AICards.sort()
        
        //arrays
        let AIHandNumbers = [AICards[0]%13, AICards[1]%13, AICards[2]%13,AICards[3]%13,]
        let AISuitNumbers =   [AICards[0]/13, AICards[1]/13, AICards[2]/13,AICards[3]/13,]
        var AIStraightChecker = [cardToCheck%13+1,AICards[0]%13+1, AICards[1]%13+1, AICards[2]%13+1,AICards[3]%13+1]
        AIStraightChecker.sort(by: >)
        print(AIHandNumbers)
        //importent varables
        var amountPairedWith = 0
        var foundStraight = false
        var amountFlushedWith = 0
            
        print("checking card#", cardToCheck)

            for i in 0...3{
                
                
                
                    if cardToCheck%13 == AIHandNumbers[i]{
                        //number of cards with the same number
                        // findes pares, triplits and quads
                        amountPairedWith += 1
                        print("paired",amountPairedWith, i)
                    }
                    if cardToCheck/13 == AISuitNumbers[i]{
                        //number of cards in the same suit
                        //trys to find a flush
                        amountFlushedWith += 1
                        print("Flushed",amountFlushedWith, i)
                    }
                    
                    if  AIStraightChecker[0]-1 == AIStraightChecker[1] && AIStraightChecker[1]-1 == AIStraightChecker[2] && AIStraightChecker[2]-1 == AIStraightChecker[3] && AIStraightChecker[3]-1 == AIStraightChecker[4]{
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
                    print("useless")
                    return 0
                }
            
        print("failed/useless")
        return 0
        }
            

    
    func probabilityChecker(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int, handValue: Int)-> Array<Int>{
        let KnownCards = [card5%13,card4%13,card3%13,card2%13,card1%13]
        var possibleCards = 0
        var pairlocations = [Int]()
        var cardsToTradeIn = [Int]()
        
        //finding and removibng known cards
        if deck.count == 0{
            for _ in 0...3{
                for i in 1...13{
                    deck.append(i)
                }
            }
        }

        for i in 0...KnownCards.count-1{
            let cardToRemove = deck.lastIndex(of: KnownCards[i])!
            deck.remove(at: cardToRemove)
        }
        //finding probility
        for currentCard in 0...KnownCards.count-1{
            for i in 0...deck.count-1{
                //finding where pares are
                if handValue == 3{
                    if KnownCards[currentCard] == deck[i]{
                        possibleCards += 1
                    }
                }
            }
            if possibleCards == 3 || possibleCards == 2 || possibleCards == 1{
                //gets location of card
                pairlocations.append(currentCard)
            }else if possibleCards == 0 {
                //uceless card
                //trade in cards
                cardsToTradeIn.append(currentCard)
            }
        }
        
        //adding info to universial array
        for i in 0...1{
            cardsToTradeIn.sort()
            nessaryValues[11+i] = cardsToTradeIn[i]
            print(nessaryValues,nessaryValues.count-1)
        }
        
        return nessaryValues
    }
    
    
    func tester(){
        AICards.removeAll()
        print("first testing of systems")
        for i in 1...52{
            if i != 0{
                deck.append(i)
            }
        }
        print("deck duping check", deck.count,"there should be 52 cards")
        for i in 0...deck.count-1{
        let number = deck.index(after: i-1)
        let removedNumber = deck.remove(at: number)
        deck.append(removedNumber)
        }
        let AICard1Location = Int.random(in: 1...deck.count-1)
        AICards.append(deck.remove(at: AICard1Location))
        
        let AICard2Location = Int.random(in: 1...deck.count-1)
       AICards.append(deck.remove(at: AICard2Location))
        
        let AICard3Location = Int.random(in: 1...deck.count-1)
        AICards.append(deck.remove(at: AICard3Location))
        
        let AICard4Location = Int.random(in: 1...deck.count-1)
        AICards.append(deck.remove(at: AICard4Location))
        
        let AICard5Location = Int.random(in: 1...deck.count-1)
        AICards.append(deck.remove(at: AICard5Location))
        print(AICards)
         let card1Value = cardChecker(cardToCheck: AICards[0], card2: AICards[1], card3: AICards[2], card4: AICards[3], card5: AICards[4])
         let card2Value = cardChecker(cardToCheck: AICards[1], card2: AICards[0], card3: AICards[2], card4: AICards[3], card5: AICards[4])
         let card3Value = cardChecker(cardToCheck: AICards[2], card2: AICards[1], card3: AICards[0], card4: AICards[3], card5: AICards[4])
         let card4Value = cardChecker(cardToCheck: AICards[3], card2: AICards[1], card3: AICards[2], card4: AICards[0], card5: AICards[4])
         let card5Value = cardChecker(cardToCheck: AICards[4], card2: AICards[1], card3: AICards[2], card4: AICards[3], card5: AICards[0])
        
        let AllCardValue = cardValuator(card1: AICards[0], card2: AICards[1], card3: AICards[2], card4: AICards[3], card5: AICards[4])
        print("card values")
        print(card1Value,card2Value,card3Value,card4Value,card5Value)
        print("together")
        print(AllCardValue)
        
        print("cards to remove")
        nessaryValues = probabilityChecker(card1: AICards[0], card2: AICards[1], card3: AICards[2], card4: AICards[3], card5: AICards[4], handValue: AllCardValue)
        print(nessaryValues[11],nessaryValues[12])
        print("Testing Ended")
        
        
    }
    
}
