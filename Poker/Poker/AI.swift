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
    var importentCardLocation = [Int]()
    
    init() {
        AICards  = [0,0,0,0,0]
        endChoice = 0
        importentCardLocation = []
    }
    init(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int) {
        AICards = [card1,card2,card3,card4,card5]
        endChoice = 0
    }
    //individual functions
    
    //checks all cards against all other cards
    func cardValuator(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
    
       
        if card5 != 0 {
            
            let AIC1 = cardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                   let AIC2 = cardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                   let AIC3 = cardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
                   let AIC4 = cardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
                   let AIC5 = cardChecker(cardToCheck: card5, card2: card2, card3: card3, card4: card4, card5: card1)
                   
                   let AICValuatorArray = [AIC1, AIC2, AIC3, AIC4, AIC5]
                   var amountOfParedCards = 0
                   // addiong stuff to nessary values

            
            for i in 0...4{
                if AICValuatorArray[i] == 6{
                    //streight flush
                    return 10
                    
                }
                if AICValuatorArray[i] == 5{
                    //quad
                    return 85
                }
                if AICValuatorArray[i] == 4{
                    //flush
                    return 65
                }
                if AICValuatorArray[i] == 3{
                    //streight
                    return 55
                }
                if AICValuatorArray[i] == 2{
                    //tripplet
                    for n in 0...4{
                        if n != i{
                            if AICValuatorArray[n] == 1{
                             //full house
                                return 75
                            }
                            return 50
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
                    return 35
                }else if amountOfParedCards == 2{
                    // pair
                    return 15
            }
        }else if card4 != 0 {
                
                let AIC1 = cardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                       let AIC2 = cardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                       let AIC3 = cardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
                       let AIC4 = cardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
            
                       let AICValuatorArray = [AIC1, AIC2, AIC3, AIC4]
            
                       var amountOfParedCards = 0
                       
                
                for i in 0...3{
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
                       

                for i in 0...2{
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
                       
                
                for i in 0...4{
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
                    }
                    //pares
                    
                    }
               if amountOfParedCards == 2{
                        // pair
                        return 1
                }
            }
        //failed to count cards? or cards amount below 2
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
    
        //importent varables
        var amountPairedWith = 0
        var foundStraight = false
        var amountFlushedWith = 0
            
        
        
        if  AIStraightChecker[0]-1 == AIStraightChecker[1] && AIStraightChecker[1]-1 == AIStraightChecker[2] && AIStraightChecker[2]-1 == AIStraightChecker[3] && AIStraightChecker[3]-1 == AIStraightChecker[4]{
            //findes straight
            foundStraight = true
        }
            for i in 0...3{
                
                
                
                    if cardToCheck%13 == AIHandNumbers[i]{
                        //number of cards with the same number
                        // findes pares, triplits and quads
                        amountPairedWith += 1
                        
                    }
                    if cardToCheck/13 == AISuitNumbers[i]{
                        //number of cards in the same suit
                        //trys to find a flush
                        amountFlushedWith += 1
                        
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
                    
                    return 0
                }
            
            return 0
        }
            

    
    func cardRemover(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int, handValue: Int, visibleCards: Array<Int>,nessaryValues: Array <Int>, needToRemoveCards: Bool)-> Array<Int>{
        var necessaryValuesCopy = nessaryValues
        //only dose this if required
        if needToRemoveCards == true{
            preventer(card1: card1, card2: card2, card3: card3, card4: card4, card5: card5, handValue: handValue, visibleCards: visibleCards)
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
            var notHappning = false
            var bestBitmap = [Int]()
            var bestBitmapScore = 0
            
            print("current Score",handValue)
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
                deckCopy.remove(at: location ?? 0)
            }
            if visibleCards != [] {
                for i in 0...visibleCards.count-1{
                    let location = deckCopy.firstIndex(of: visibleCards[i])
                    deckCopy.remove(at: location!)
                }
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
                    for _ in 0...99{
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
                    avrageScore /= 100
                    comboScoreResults.append(avrageScore)
                    isComboUsefull.append(1)
                }//else close
                
            }//i-loop close
            //allBitmaps has 32 entries of 5 or 160 total entries
            // there is 32 posible entries of 5
            for bitmapNumber in 0...31{
                notHappning = false
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
                        //findes all cards to replace
                        for i in 0...bitmap.count-1{
                                if bitmap[i] == 1{
                                    locations.append(i)
                                }
                        }
                        if importentCardLocation != [] && locations.count != 0{
                            for i in 0...locations.count-1{
                                for n in 0...importentCardLocation.count-1{
                                    if locations[i] == importentCardLocation[n]{
                                        notHappning = true
                                    }
                                }
                            }
                        }
                        if bestBitmapScore < comboScoreResults[bitmapNumber]{
                                if notHappning != true{
                                //best Bitmap
                                    print("best bitmap numbers",bestBitmap, "score",bestBitmapScore)
                                    bestBitmapScore = comboScoreResults[bitmapNumber]
                                    necessaryValuesCopy[14] = bestBitmapScore
                                    bestBitmap.removeAll()
                                    for a in 0...4{
                                        bestBitmap.append(bitmap[a])
                                    }
                                    print("new Best Bitmap", bestBitmap, "score", bestBitmapScore)
                                    print("removal",locations)
                                    if locations.count != 0{
                                        for locationInLocations in 0...locations.count-1{
                                                necessaryValuesCopy[11 + locationInLocations] = locations[locationInLocations]+1
                                        }
                                    }
                            }//nothappning end
                            notHappning = false
                        }//bestbitmap end
                        locations.removeAll()
                    }//score else end
                }//usefull else end
            }//i-loop end
        }
        return necessaryValuesCopy
    }
    
    func preventer(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int, handValue: Int, visibleCards: Array<Int>){
        var hand = [card5,card4,card3,card2,card1]
        var deckCopy =  [Int]()
        var highCardNumber = [Int]()
        var highCardLocation = [Int]()
        //recreating the deck
        for i in 1...52{
            deckCopy.append(i)
        }
        //removing known cards form the deck
        for i in 0...hand.count-1{
            let location = deckCopy.firstIndex(of: hand[i])
            deckCopy.remove(at: location ?? 0)
        }
        if visibleCards != [] {
            for i in 0...visibleCards.count-1{
                let location = deckCopy.firstIndex(of: visibleCards[i])
                deckCopy.remove(at: location!)
            }
        }
        //we need to find whitch cards would give us the win
        //ways we can do it.
        //the more unlikly thing to happen could win
        //having the highests of card
            //find our highest card
        hand.sort(by: >)
        for i in 0...hand.count-1{
            if (hand[i]%13) > 11 || (hand[i]%13)  < 1{
                //found cards higher then 11
                highCardNumber.append(hand[i])
                highCardLocation.append(i)
            }
        }
        //find high card's roals in hand
        if highCardLocation != []{
            for i in 0...highCardLocation.count-1{
                hand.remove(at: highCardLocation[i])
                let highCardScore = cardChecker(cardToCheck: highCardNumber[i], card2: hand[0], card3: hand[1], card4: hand[2], card5: hand[3])
                hand.append(highCardNumber[i])
                if highCardScore != 0{
                    //card is doing something
                    if highCardScore >= 2{
                        //vary importent
                        importentCardLocation.append(highCardLocation[i])
                        //tries to prevent AI from going down from a meaningfull level
                    }
                }
            }
        }
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
    
    func fullHandDealer(deck: Array<Int>, isItGlobal: Bool)-> Array<Int>{
        var tepDeckCopy = deck
        var hand = [Int]()
        for _ in 0...4{
            hand.append(singleCardDealer(usedDeck: tepDeckCopy, isItGlobal: true))
            tepDeckCopy = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        }
                
        return hand
    }
    
    func highCardDetector(hand:Array<Int>,handValue:Int)-> Double{
        //this function findes the highest card and adds a 0.X value to the current value
        var handCopy = hand
        let handValueCapy = handValue
        var addedPointValue = 0.0
        var cardValues = [Int]()
        handCopy.sort(by: >)
        //puts all checked cards into array
        for i in 0...handCopy.count-1{
            cardValues.append(cardChecker(cardToCheck: handCopy[i], card2: handCopy[(i+1)%5], card3: handCopy[(i+2)%5], card4: handCopy[(i+3)%5], card5: handCopy[(i+4)%5]))
        }
        for i in 0...handCopy.count-1{
            if handCopy[i] != 0 && addedPointValue != 0{
                if handCopy[i]%13 == 1 {
                    addedPointValue = 0.99
                }else if handCopy[i]%13 == 0 {
                    addedPointValue = 0.96
                }else if handCopy[i]%13 == 12 {
                    addedPointValue = 0.94
                }else if handCopy[i]%13 == 11 {
                    addedPointValue = 0.92
                }else if handCopy[i]%13 == 10 {
                    addedPointValue = 0.9
                }else if handCopy[i]%13 == 9 {
                    addedPointValue = 0.8
                }else if handCopy[i]%13 == 8 {
                    addedPointValue = 0.7
                }else if handCopy[i]%13 == 7 {
                    addedPointValue = 0.6
                }else if handCopy[i]%13 == 6 {
                    addedPointValue = 0.5
                }else if handCopy[i]%13 == 5 {
                    addedPointValue = 0.4
                }else if handCopy[i]%13 == 4 {
                    addedPointValue = 0.3
                }else if handCopy[i]%13 == 3 {
                    addedPointValue = 0.2
                }else if handCopy[i]%13 == 2 {
                    addedPointValue = 0.1
                }
            }
        }
        return Double(handValueCapy) + addedPointValue
    }
}
