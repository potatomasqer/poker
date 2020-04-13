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
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in, 14 chance opponent has a better card
    var nessaryValues = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    
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
            

    
    func probabilityChecker(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int, handValue: Int, visibleCards: Array<Int>, necessaryValues: Array<Int>)-> Array<Int>{
        //visible cards dose not include hand
        var hand = [card5,card4,card3,card2,card1]
        let handExtra = hand
        var deckCopy =  [Int]()
        var bitmap = [0,0,0,0,0]
        var comboScoreResults = [Int]()
        var avrageScore = 0
        var allBitmaps = [Int()]
        var isComboUsefull = [Int]()
        var locations = [Int]()
        var necessaryValuesCopy = nessaryValues
        
        //doing stuff with nessaryValues
        for i in 0...4{
            necessaryValuesCopy[i] = hand[i]
        }
        //making and removing known cards from deckCopy
        for i in 1...52{
            deckCopy.append(i)
        }
        for i in 0...hand.count-1{
            let location = deckCopy.firstIndex(of: hand[i])
            deckCopy.remove(at: location!)
        }
        for i in 0...visibleCards.count-1{
            let location = deckCopy.firstIndex(of: visibleCards[i])
            deckCopy.remove(at: location!)
        }
        
        //looking thrue all combonations of replaced cards
        for i in 0...31{
            var iShifted: Int = i
            var bitCount = 0
            for bitChecked in 0...4{
                bitmap[bitChecked] = iShifted%2
                iShifted = iShifted/2
                bitCount += bitmap[bitChecked]
            }
            allBitmaps.append(contentsOf: bitmap)
            
            if bitCount > 3{
                comboScoreResults.append(0)
                isComboUsefull.append(0)
            }else{
                for _ in 0...49{
                    //finds replacement cards for that test and removes them from deck temperalaly
                    //total of 3 cards
                    
                    //card 1
                    let replaceCard1 = singleCardDealer(usedDeck: deckCopy, isItGlobal: false)
                    let location1 = deckCopy.firstIndex(of: replaceCard1)
                    deckCopy.remove(at: location1!)
                    //card 2
                    let replaceCard2 = singleCardDealer(usedDeck: deckCopy, isItGlobal: false)
                    let location2 = deckCopy.firstIndex(of: replaceCard2)
                    deckCopy.remove(at: location2!)
                    //card 3
                    let replaceCard3 = singleCardDealer(usedDeck: deckCopy, isItGlobal: false)
                    let location3 = deckCopy.firstIndex(of: replaceCard3)
                    deckCopy.remove(at: location3!)
                    //replaceinhg cards
                    for m in 0...4{
                        var replacementNumber = 1
                        
                        if bitmap[m] == 1{
                             
                            if replacementNumber == 1{
                                hand[m] = replaceCard1
                                replacementNumber += 1
                            }
                            if replacementNumber == 2{
                                hand[m] = replaceCard2
                                replacementNumber += 1
                            }
                            if replacementNumber == 3{
                                hand[m] = replaceCard3
                                replacementNumber += 1
                            }else if replacementNumber < 3{
                                print("to many required replacements")
                            }
                            
                        }
                    }//M-loop Close
                    //averaging results from M-loop
                    let score = cardValuator(card1: hand[0], card2: hand[1], card3: hand[2], card4: hand[3], card5: hand[4])
                    avrageScore += score
                    //reseting deckCopy and hand
                    deckCopy.append(replaceCard1)
                    deckCopy.append(replaceCard2)
                    deckCopy.append(replaceCard3)
                    
                    hand = handExtra
                    
                }//_-loop close
                avrageScore /= 50
                comboScoreResults.append(avrageScore)
                isComboUsefull.append(1)
            }//else close
            
        }//i-loop close
        //allBitmaps has 32 entries of 5 or 160 total entries
        // there is 32 posible entries of 5
        for bitmapNumber in 0...31{
            var usefulBitmaps = 0
            for i in 0...4{
                bitmap[i] = allBitmaps[bitmapNumber*5+i]
            }
            if isComboUsefull[bitmapNumber] == 0{
              //bitmap is useless
            }else if isComboUsefull[bitmapNumber] == 1{
                //bitmap could be usefull
                //how good is the bitmap?
                if comboScoreResults[bitmapNumber] < handValue{
                    //combo is worce than current hand
                }else{
                    //bitmap produces results better then current hand
                    usefulBitmaps += 1
                    //findes all cards to replace
                    for i in 0...4{
                            if bitmap[i] == 1{
                            locations.append(i)
                        }
                    }// end of i-loop
                    if locations.count <= 4{
                        //not doing it
                    }else{
                        //can do
                        for locationInLocations in 0...locations.count-1{
                            necessaryValuesCopy[11 + locationInLocations] = locations[locationInLocations]
                        }
                    }
                }//score else end
            }//usefull else end
        }//i-loop end
        
        return necessaryValuesCopy
    }
    
    
    func singleCardDealer(usedDeck: Array<Int>, isItGlobal: Bool)-> Int{
        var deck = usedDeck
        let dealtCardLocation = Int.random(in: 0...deck.count-1)
        let deltCard = deck[dealtCardLocation]
        
        //sees if deck is global/used in game
        if isItGlobal == true{
            deck.remove(at: dealtCardLocation)
            let defaults = UserDefaults.standard
            defaults.set(usedDeck, forKey: "GlobalDeck")
        }
        return deltCard
    }
}
