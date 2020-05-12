//
//  AIWar.swift
//  Poker
//
//  Created by Aaron Brey on 5/12/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class AIWar: UIViewController {
    //global
    var AIControler = AI()
    var deck = [Int]()
    var deckCopy = [Int]()
    var importentCardLocation = [Int]()
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
    
    func customCardRemover(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int, handValue: Int, visibleCards: Array<Int>,nessaryValues: Array <Int>, needToRemoveCards: Bool)-> Array<Int>{
        var necessaryValuesCopy = nessaryValues
        //only dose this if required
        if needToRemoveCards == true{
            AIControler.preventer(card1: card1, card2: card2, card3: card3, card4: card4, card5: card5, handValue: handValue, visibleCards: visibleCards)
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
                        let replaceCard1 = AIControler.singleCardDealer(usedDeck: deckCopy, isItGlobal: false)
                        let location1 = deckCopy.firstIndex(of: replaceCard1)
                        deckCopy.remove(at: location1!)
                        //card 2
                        let replaceCard2 = AIControler.singleCardDealer(usedDeck: deckCopy, isItGlobal: false)
                        let location2 = deckCopy.firstIndex(of: replaceCard2)
                        deckCopy.remove(at: location2!)
                        //card 3
                        let replaceCard3 = AIControler.singleCardDealer(usedDeck: deckCopy, isItGlobal: false)
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
                        let score = AIControler.cardValuator(card1: hand[0], card2: hand[1], card3: hand[2], card4: hand[3], card5: hand[4])
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
    
    
    func customCardValuator(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
    
       
        if card5 != 0 {
                   let AIC1 = AIControler.cardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                   let AIC2 = AIControler.cardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                   let AIC3 = AIControler.cardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
                   let AIC4 = AIControler.cardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
                   let AIC5 = AIControler.cardChecker(cardToCheck: card5, card2: card2, card3: card3, card4: card4, card5: card1)
                   
                   let AICValuatorArray = [AIC1, AIC2, AIC3, AIC4, AIC5]
                   var amountOfParedCards = 0
                   // addiong stuff to nessary values

            
            for i in 0...4{
                if AICValuatorArray[i] == 6{
                    //streight flush
                    return 100
                    
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
        }
        //failed to count cards? or cards amount below 2
        return 0
    }

}
