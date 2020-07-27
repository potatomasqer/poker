//
//  AIWar.swift
//  Poker
//
//  Created by Aaron Brey on 5/12/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class AIWar: UIViewController {
    //outputs
    @IBOutlet weak var AI1card1: UILabel!
    @IBOutlet weak var AI1card2: UILabel!
    @IBOutlet weak var AI1card3: UILabel!
    @IBOutlet weak var AI1card4: UILabel!
    @IBOutlet weak var AI1card5: UILabel!
    
    
    @IBOutlet weak var AI2card5: UILabel!
    @IBOutlet weak var AI2card4: UILabel!
    @IBOutlet weak var AI2card3: UILabel!
    @IBOutlet weak var AI2card2: UILabel!
    @IBOutlet weak var AI2card1: UILabel!
    
    @IBOutlet weak var AI3card1: UILabel!
    @IBOutlet weak var AI3card2: UILabel!
    @IBOutlet weak var AI3card3: UILabel!
    @IBOutlet weak var AI3card4: UILabel!
    @IBOutlet weak var AI3card5: UILabel!
    
    
    @IBOutlet weak var AI1WinText: UILabel!
    @IBOutlet weak var AI2WinText: UILabel!
    @IBOutlet weak var AI3WinText: UILabel!
    
    
    
    //global
    var AIControler = AI()
    var deck = [Int]()
    var deckCopy = [Int]()
    var importentCardLocation = [Int]()
    var topBet = 0
    var gameInProgress = false
    var amountCalled = 0
    var ifRasedThisTurn = false
    var whoRasedLast = 1
    var notFirstRased = false
    var amountOut = 0
    var winProcessed = false
    //AI 1
     //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 Choice
    var AI1Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI1Hand = [Int]()
    var AI1VisableCards = [Int]()
    var AI1Wins = 0
    var AI1BetAmount = 0
    var AI1AmountLeft = 10000
    var is1out = false
    //AI 2
     //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 Choice
    var AI2Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI2Hand = [Int]()
    var AI2VisableCards = [Int]()
    var AI2Wins = 0
    var AI2BetAmount = 0
    var AI2AmountLeft = 10000
    var is2out = false
    //AI 3
     //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 Choice
    var AI3Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI3Hand = [Int]()
    var AI3VisableCards = [Int]()
    var AI3Wins = 0
    var AI3BetAmount = 0
    var AI3AmountLeft = 10000
    var is3out = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playOne(_ sender: UIButton) {
        resetAll()
        gameInProgress = true
        for i in 1...52{
            deck.append(i)
        }
        deckCopy = deck
        print(deck.count)
        AI1Hand = AIControler.fullHandDealer(deck: deck, isItGlobal: true)
        deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
        
        AI2Hand = AIControler.fullHandDealer(deck: deck, isItGlobal: true)
        deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]

        AI3Hand = AIControler.fullHandDealer(deck: deck, isItGlobal: true)
        deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]

        //AI 1 lv1
        //AI 2 lv2
        //AI 3 lv3
        gameInProgress = true
        var i = 0
        while gameInProgress == true{
            ifRasedThisTurn = false
            print("printing i", i)
            //AI1 turn
            if  is1out == false{
                if i == 0{
                    print(i)
                        AI1Values = AIControler.AITurn(hand: AI1Hand, handValue: AI1Values[10], howManyCardsInHand: 5, howManyPlayers: 2, ifRaisedThisTurn: ifRasedThisTurn, canRemoveCards: true, howManyRemovedCards: 3, visableCards: [], nessaryValues: AI1Values, gameDeck: deck, AILV: 3)
                    }
                    if i != 0{
                        AI1Values = AIControler.AITurn(hand: AI1Hand, handValue: AI1Values[10], howManyCardsInHand: 5, howManyPlayers: 2, ifRaisedThisTurn: ifRasedThisTurn, canRemoveCards: false, howManyRemovedCards: 3, visableCards: [], nessaryValues: AI1Values, gameDeck: deck, AILV: 4)
                        }
                    
                    
                    if AI1Values[15] == 3{
                        print("AI1 Raised")
                        ifRasedThisTurn = true
                        whoRasedLast = 1
                        amountCalled = 0
                        topBet += 100
                        AI1BetAmount+=100
                        AI1AmountLeft -= 100
                    }
                    if AI1Values[15] == 2{
                        print("AI1 folds")
                        is1out = true
                        amountOut += 1
                    }
                    if AI1Values[15] == 1{
                        print("AI1Calls")
                        amountCalled += 1
                        //call
                        AI1AmountLeft -= topBet-AI1BetAmount
                        AI1BetAmount = topBet
                    }
            }
            
            //AI2 turn
            if  is2out == false{
                if i == 0{
                    AI2Values = AIControler.AITurn(hand: AI2Hand, handValue: AI2Values[10], howManyCardsInHand: 5, howManyPlayers: 2, ifRaisedThisTurn: ifRasedThisTurn, canRemoveCards: true, howManyRemovedCards: 3, visableCards: [], nessaryValues: AI2Values, gameDeck: deck, AILV: 2)
                }
                if i != 0{
                    AI2Values = AIControler.AITurn(hand: AI2Hand, handValue: AI2Values[10], howManyCardsInHand: 5, howManyPlayers: 2, ifRaisedThisTurn: ifRasedThisTurn, canRemoveCards: false, howManyRemovedCards: 3, visableCards: [], nessaryValues: AI2Values, gameDeck: deck, AILV: 2)
                }
                if AI2Values[15] == 3{
                    print("AI2 Raised")
                    ifRasedThisTurn = true
                    whoRasedLast = 2
                    amountCalled = 0
                    topBet += 100
                    AI2BetAmount+=100
                    AI2AmountLeft -= 100
                }
                if AI2Values[15] == 2{
                    print("AI2 folds")
                    is2out = true
                    amountOut += 1
                }
                if AI2Values[15] == 1{
                    notFirstRased = false
                    print("AI2Calls")
                    amountCalled += 1
                    //call
                    AI2AmountLeft -= topBet-AI2BetAmount
                    AI2BetAmount = topBet
                }
            }
            //AI 3 turn
            if  is3out == false{
                if i == 0{
                    AI3Values = AIControler.AITurn(hand: AI3Hand, handValue: AI3Values[10], howManyCardsInHand: 5, howManyPlayers: 2, ifRaisedThisTurn: ifRasedThisTurn, canRemoveCards: true, howManyRemovedCards: 3, visableCards: [], nessaryValues: AI3Values, gameDeck: deck, AILV: 3)
                }
                if i != 0{
                    AI3Values = AIControler.AITurn(hand: AI3Hand, handValue: AI3Values[10], howManyCardsInHand: 5, howManyPlayers: 2, ifRaisedThisTurn: ifRasedThisTurn, canRemoveCards: false, howManyRemovedCards: 3, visableCards: [], nessaryValues: AI3Values, gameDeck: deck, AILV: 3)
                }
                if AI3Values[15] == 3{
                    print("AI3 Raised")
                    ifRasedThisTurn = true
                    whoRasedLast = 3
                    amountCalled = 0
                    topBet += 100
                    AI3BetAmount+=100
                    AI3AmountLeft -= 100
                }
                if AI3Values[15] == 2{
                    print("AI3 folds")
                    is3out = true
                    amountOut += 1
                }
                if AI3Values[15] == 1{
                    print("AI3Calls")
                    amountCalled += 1
                    //call
                    AI3AmountLeft -= topBet-AI3BetAmount
                    AI3BetAmount = topBet
                }
            }
            //end of round
            if gameInProgress == true{
                if 1 == 1{
                    i += 1
                    if whoRasedLast == 1{
                        ifRasedThisTurn = false
                    }
                }
            }
            
            // ending 1
            if AI1AmountLeft == 0 || AI2AmountLeft == 0 || AI3AmountLeft == 0{
                print("one player is out of cash")
                print("AI1", AI1AmountLeft)
                print("AI2",AI2AmountLeft)
                print("AI3",AI3AmountLeft)
                print("ammount out",amountOut)
                //all in finnish
                gameInProgress = false
                print("values",AI1Values[10],AI2Values[10],AI3Values[10])
                if AI1Values[10] > AI2Values[10] && AI1Values[10] > AI3Values[10]{
                    winProcessed = true
                    //Ai 1 wins
                    AI1Wins += 1
                    print("AI1 wins", AI1Values[10], AI2Values[10], AI3Values[10] )
                }else if AI2Values[10] > AI1Values[10] && AI2Values[10] > AI3Values[10]{
                    winProcessed = true
                    //AI 2 wins
                    AI2Wins += 1
                    print("AI2 wins",  AI1Values[10], AI2Values[10], AI3Values[10])
                }else if AI3Values[10] > AI1Values[10] && AI3Values[10] > AI2Values[10]{
                    winProcessed = true
                    //AI 3 wins
                    AI3Wins += 1
                    print("AI3 wins", AI1Values[10], AI2Values[10], AI3Values[10])
                }else{
                    winProcessed = true
                    //they are equal
                    //highcard finder iniation
                    let AI1Double = AIControler.highCardDetector(hand: AI1Hand, handValue: AI1Values[10])
                    let AI2Double = AIControler.highCardDetector(hand: AI2Hand, handValue: AI2Values[10])
                    let AI3Double = AIControler.highCardDetector(hand: AI3Hand, handValue: AI3Values[10])
                    if AI1Double > AI2Double && AI1Double > AI3Double {
                        AI1Wins += 1
                        print("AI1 wins", AI1Values[10], AI2Values[10], AI3Values[10] )
                    }else if AI2Double > AI1Double && AI2Double > AI3Double{
                        AI2Wins += 1
                        print("AI2 wins",  AI1Values[10], AI2Values[10], AI3Values[10])
                    }else if AI3Double > AI1Double && AI3Double > AI2Double{
                        AI3Wins += 1
                        print("AI3 wins", AI1Values[10], AI2Values[10], AI3Values[10])
                    }else{
                        print("nobody won")
                    }

                }
            }
            //ending 2
            if amountCalled <= 2{
                print("all Called")
                print("AI1", AI1AmountLeft)
                print("AI2",AI2AmountLeft)
                print("AI3",AI3AmountLeft)
                print("ammount out",amountOut)
                gameInProgress = false
                if winProcessed == false{
                    print("win not processed")
                    //all in finnish
                    if AI1Values[10] > AI2Values[10] && AI1Values[10] > AI3Values[10]{
                        //Ai 1 wins
                        AI1Wins += 1
                        print("AI1 wins", AI1Values[10], AI2Values[10], AI3Values[10])
                    }else if AI2Values[10] > AI1Values[10] && AI2Values[10] > AI3Values[10]{
                        //AI 2 wins
                        AI2Wins += 1
                        print("AI2 wins", AI1Values[10], AI2Values[10], AI3Values[10])
                    }else if AI3Values[10] > AI1Values[10] && AI3Values[10] > AI2Values[10]{
                        //AI 3 wins
                        AI3Wins += 1
                        print("AI3 wins", AI1Values[10], AI2Values[10], AI3Values[10])
                    }else{
                        print("they are equel")
                        //they are equal
                        //highcard finder iniation
                        let AI1Double = AIControler.highCardDetector(hand: AI1Hand, handValue: AI1Values[10])
                        let AI2Double = AIControler.highCardDetector(hand: AI2Hand, handValue: AI2Values[10])
                        let AI3Double = AIControler.highCardDetector(hand: AI3Hand, handValue: AI3Values[10])
                        if AI1Double > AI2Double && AI1Double > AI3Double {
                            AI1Wins += 1
                            print("AI1 wins", AI1Values[10], AI2Values[10], AI3Values[10])
                        }else if AI2Double > AI1Double && AI2Double > AI3Double{
                            AI2Wins += 1
                            print("AI2 wins", AI1Values[10], AI2Values[10], AI3Values[10])
                        }else if AI3Double > AI1Double && AI3Double > AI2Double{
                            AI3Wins += 1
                            print("AI3 wins", AI1Values[10], AI2Values[10], AI3Values[10])
                        }else{
                            print("nobody won", AI1Values[10], AI2Values[10], AI3Values[10])
                        }

                    }
                }
            }
            //ending 3
            if amountOut == 2{
                print("ammount out",amountOut)
                if winProcessed == false{
                    print("win not processed")
                    print("2 out")
                    if is1out == false{
                        AI1Wins += 1
                        gameInProgress = false
                        print("AI1 wins")
                    }
                    if is2out == false{
                        AI2Wins += 1
                        gameInProgress = false
                        print("AI2 wins")
                    }
                    if is3out == false{
                        AI3Wins += 1
                        gameInProgress = false
                        print("AI3 wins")
                    }
                }
                gameInProgress = false
            }
            
            //typing into labels
            AI1card1.text = String(AI1Hand[0]%13+1)
            AI1card2.text = String(AI1Hand[1]%13+1)
            AI1card3.text = String(AI1Hand[2]%13+1)
            AI1card4.text = String(AI1Hand[3]%13+1)
            AI1card5.text = String(AI1Hand[4]%13+1)
        
            AI2card1.text = String(AI2Hand[0]%13+1)
            AI2card2.text = String(AI2Hand[1]%13+1)
            AI2card3.text = String(AI2Hand[2]%13+1)
            AI2card4.text = String(AI2Hand[3]%13+1)
            AI2card5.text = String(AI2Hand[4]%13+1)
            
            AI3card1.text = String(AI3Hand[0]%13+1)
            AI3card2.text = String(AI3Hand[1]%13+1)
            AI3card3.text = String(AI3Hand[2]%13+1)
            AI3card4.text = String(AI3Hand[3]%13+1)
            AI3card5.text = String(AI3Hand[4]%13+1)
            
            AI1WinText.text = String(AI1Wins)
            AI2WinText.text = String(AI2Wins)
            AI3WinText.text = String(AI3Wins)
        }//while end
    }
    
    
    
    
    
    
    
    @IBAction func playXTimes(_ sender: Any) {
        for i in 1...52{
            if i != 0{
            deck.append(i)
            }
        }
        for _ in 0...100{
            deckCopy = deck
            AI1Hand = AIControler.fullHandDealer(deck: deck, isItGlobal: true)
            deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
            
            AI2Hand = AIControler.fullHandDealer(deck: deck, isItGlobal: true)
            deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
            //AI 1 defult
            //AI 2 Custom
            AI1Values = AIControler.cardRemover(card1: AI1Hand[0], card2: AI1Hand[1], card3: AI1Hand[2], card4: AI1Hand[3], card5: AI1Hand[4], handValue: AIControler.cardValuator(card1: AI1Hand[0], card2: AI1Hand[1], card3: AI1Hand[2], card4: AI1Hand[3], card5: AI1Hand[4]), visibleCards: AI1VisableCards, nessaryValues: AI1Values)
            for i in 0...2{
                if AI1Values[11+i] != 0{
                    AI1Hand[AI1Values[11+i]] = AIControler.singleCardDealer(usedDeck: deck, isItGlobal: true)
                    deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
                }
            }
            AI2Values = customCardRemover(card1: AI2Hand[0], card2: AI2Hand[1], card3: AI2Hand[2], card4: AI2Hand[3], card5: AI2Hand[4], handValue: customCardValuator(card1: AI2Hand[0], card2: AI2Hand[1], card3: AI2Hand[2], card4: AI2Hand[3], card5: AI2Hand[4]), visibleCards: AI1VisableCards, nessaryValues: AI2Values, needToRemoveCards: true)
            for i in 0...2{
                if AI2Values[11+i] != 0{
                    AI2Hand[AI1Values[11+i]] = AIControler.singleCardDealer(usedDeck: deck, isItGlobal: true)
                    deck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
                }
            }
            AI1Values[10] = AIControler.cardValuator(card1: AI1Hand[0], card2: AI1Hand[1], card3: AI1Hand[2], card4: AI1Hand[3], card5: AI1Hand[4])
            AI2Values[10] = AIControler.cardValuator(card1: AI2Hand[0], card2: AI2Hand[1], card3: AI2Hand[2], card4: AI2Hand[3], card5: AI2Hand[4])
            if AI1Values[10] > AI2Values[10]{
                //Ai 1 wins
                AI1Wins += 1
            }else if AI1Values[10] < AI2Values[10]{
                //AI 2 wins
                AI2Wins += 1
            }else{
                //they are equal
                //highcard finder iniation
                let AI1Double = AIControler.highCardDetector(hand: AI1Hand, handValue: AI1Values[10])
                let AI2Double = AIControler.highCardDetector(hand: AI2Hand, handValue: AI2Values[10])
                
                if AI1Double > AI2Double{
                    AI1Wins += 1
                }else if AI1Double < AI2Double{
                    AI2Wins += 1
                }
            }
            AI1card1.text = String(AI1Hand[0]%13)
            AI1card2.text = String(AI1Hand[1]%13)
            AI1card3.text = String(AI1Hand[2]%13)
            AI1card4.text = String(AI1Hand[3]%13)
            AI1card5.text = String(AI1Hand[4]%13)
            
            AI2card1.text = String(AI2Hand[0]%13)
            AI2card2.text = String(AI2Hand[1]%13)
            AI2card3.text = String(AI2Hand[2]%13)
            AI2card4.text = String(AI2Hand[3]%13)
            AI2card5.text = String(AI2Hand[4]%13)
            
            AI1WinText.text = String(AI1Wins)
            AI2WinText.text = String(AI2Wins)
            
            deck = deckCopy
        }// _ loop end
        deck = []
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
    func resetAll(){
         deck = [Int]()
         deckCopy = [Int]()
         importentCardLocation = [Int]()
         topBet = 0
         gameInProgress = false
         amountCalled = 0
         whoRasedLast = 1
         winProcessed = false
         amountOut = 0

         AI1Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
         AI1Hand = [Int]()
         AI1VisableCards = [Int]()
         AI1Wins = 0
         AI1BetAmount = 0
         AI1AmountLeft = 10000
         is1out = false
        
         AI2Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
         AI2Hand = [Int]()
         AI2VisableCards = [Int]()
         AI2Wins = 0
         AI2BetAmount = 0
         AI2AmountLeft = 10000
         is2out = false
        
         AI3Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
         AI3Hand = [Int]()
         AI3VisableCards = [Int]()
         AI3Wins = 0
         AI3BetAmount = 0
         AI3AmountLeft = 10000
         is3out = false
        
    }

}
