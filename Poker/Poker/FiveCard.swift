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
    var deckCopy = [Int]()
    var importentCardLocation = [Int]()
    var topBet = 0
    var gameInProgress = false
    var amountCalled = 0
    var ifRasedThisTurn = false
    var whoRasedLast = 1
    var notFirstRased = false
    var amountOut = 0
    var numberOfActivePlayers = 2
    var winProcessed = false    //local varables
    //human player
    var hValues = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var hHand = [Int]()
    var hVisableCards = [Int]()
    var hWins = 0
    var hBetAmount = 0
    var hAmountLeft = 10000
    var ishout = false

        
    //AI's max of 6 AI's
    //AI 1
   var AI1Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI1Hand = [Int]()
    var AI1VisableCards = [Int]()
    var AI1Wins = 0
    var AI1BetAmount = 0
    var AI1AmountLeft = 10000
    var is1out = false
    
    //AI 2
   var AI2Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI2Hand = [Int]()
    var AI2VisableCards = [Int]()
    var AI2Wins = 0
    var AI2BetAmount = 0
    var AI2AmountLeft = 10000
    var is2out = false
    
    //AI 3
    var AI3Hand = [Int]()
    var AITotalBet3 = 0
    var AI3Cashleft = 0
    var AIChoice3 = 0
    
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 Ai Choice
    var AI3Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI3VisableCards = [Int]()

    //AI 4
    var AI4Hand = [Int]()
    var AITotalBet4 = 0
    var AI4Cashleft = 0
    var AIChoice4 = 0
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 Ai Choice
    var AI4Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI4VisableCards = [Int]()

    //AI 5
    var AI5Hand = [Int]()
    var AITotalBet5 = 0
    var AI5Cashleft = 0
    
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 Ai Choice
    var AI5Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI5VisableCards = [Int]()
    var AIChoice5 = 0
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
    }
    
    
    func gameStart() {
        //on game start we want to first start to play animations of plyer geting cards
        //cards will be randomized and handed out to player and computers
        //step one
        //pass out cards to players
        //step two
        //get choice from player
        //step three
        //pass it on to the next player
        
        //sets up a changing varable
        numberOfActivePlayers = numberOfPlayers
        //gives player id's
        var i = 0
        gameInProgress = true
        while gameInProgress == true{
            //human turn
            if ishout == false{
                if i == 0{
                
                //wait for choice..
                //actions
                //includes 3 options for the player that trigger flags and moves on
                //if it is round one then card actions become avalable
                //cards are images you can interact with on the first round
                //you can slect up to 3 cards to throw away.
                    //first round
                    let alert = UIAlertController.init(title: "Cards to remove", message: "Whitch cards do you wish to remove" + "\n" + "you can fill out all or none of the textfields", preferredStyle: .alert)
                    alert.addTextField()
                    alert.addTextField()
                    alert.addTextField()
                    alert.textFields![0].placeholder = "remove card #"
                    alert.textFields![1].placeholder = "remove card #"
                    alert.textFields![2].placeholder = "remove card #"
                    
                    
                    let done = UIAlertAction.init(title: "Done", style: .default) { (UIAlertAction) in
                        var hRemovedCards = [Int]()
                        for i in 0...alert.textFields!.count{
                            if alert.textFields![i].text != ""{
                                hRemovedCards.append(Int(alert.textFields![i].text!)!)
                            }
                        }
                        if hRemovedCards.count != 0{
                            for i in 0...hRemovedCards.count-1{
                                self.hHand[hRemovedCards[i]] = self.aiControler.singleCardDealer(usedDeck: self.gameDeck, isItGlobal: true)
                                self.gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
                            }
                        }
                        self.hValues[10] = self.aiControler.cardValuator(card1: self.hHand[0], card2: self.hHand[1], card3: self.hHand[2], card4: self.hHand[3], card5: self.hHand[4])
                    }
                    alert.addAction(done)
                    present(alert, animated: true)
                }
                let alert = UIAlertController.init(title: "Turn", message: "what do you want to do", preferredStyle: .alert)
                let call = UIAlertAction.init(title: "Call", style: .default) { (UIAlertAction) in
                    self.hValues[15] = 1
                }
                let raise = UIAlertAction.init(title: "Raise", style: .default) { (UIAlertAction) in
                    self.hValues[15] =  3
                }
                let fold = UIAlertAction.init(title: "Fold", style: UIAlertAction.Style.default) { (UIAlertAction) in
                    self.hValues[15] = 2
                }
                alert.addAction(call)
                alert.addAction(raise)
                alert.addAction(fold)
                
                
                //human turn finnished
                if hValues[15] == 3{
                    print("h Raised")
                    ifRasedThisTurn = true
                    whoRasedLast = 1
                    amountCalled = 0
                    topBet += 100
                    hBetAmount+=100
                    hAmountLeft -= 100
                }
                if hValues[15] == 2{
                    print("h folds")
                    ishout = true
                    amountOut += 1
                }
                if hValues[15] == 1{
                    print("hCalls")
                    amountCalled += 1
                    //call
                    hAmountLeft -= topBet-hBetAmount
                    hBetAmount = topBet
                }
                //check for any vistory condidtons
                victoryChecker()
            }
            
            //AI1 turn
            if  is1out == false{
                if i == 0{
                    print(i)
                        AI1Values = aiControler.AITurn(hand: AI1Hand, handValue: AI1Values[10], howManyCardsInHand: 5, howManyPlayers: 2, ifRaisedThisTurn: ifRasedThisTurn, canRemoveCards: true, howManyRemovedCards: 3, visableCards: [], nessaryValues: AI1Values, gameDeck: gameDeck, AILV: 3)
                    }
                    if i != 0{
                        AI1Values = aiControler.AITurn(hand: AI1Hand, handValue: AI1Values[10], howManyCardsInHand: 5, howManyPlayers: 2, ifRaisedThisTurn: ifRasedThisTurn, canRemoveCards: false, howManyRemovedCards: 3, visableCards: [], nessaryValues: AI1Values, gameDeck: gameDeck, AILV: 4)
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
            victoryChecker()
            
        }
        
    }
    
    
    func victoryChecker(){
        //ending 1
        if amountCalled <= 2{
            print("all Called")
            print("h", hAmountLeft)
            print("AI1",AI1AmountLeft)
            print("ammount out",amountOut)
            gameInProgress = false
            if winProcessed == false{
                print("win not processed")
                //all in finnish
                if hValues[10] > AI1Values[10]{
                    //Ai 1 wins
                    hWins += 1
                    print("h wins", hValues[10], AI1Values[10])
                }else if AI1Values[10] > hValues[10]{
                    //AI 2 wins
                    AI1Wins += 1
                    print("AI1 wins", hValues[10], AI1Values[10])
                }else{
                    print("they are equel")
                    //they are equal
                    //highcard finder iniation
                    let AI1Double = aiControler.highCardDetector(hand: hHand, handValue: hValues[10])
                    let AI2Double = aiControler.highCardDetector(hand: AI2Hand, handValue: AI2Values[10])
                    if AI1Double > AI2Double {
                        AI1Wins += 1
                        print("AI1 wins", AI1Values[10], AI2Values[10])
                    }else if AI2Double > AI1Double{
                        AI2Wins += 1
                        print("AI2 wins", AI1Values[10], AI2Values[10])
                    }else{
                        print("nobody won", AI1Values[10], AI2Values[10])
                    }

                }
            }
        }
        //ending 2
        if amountOut <= numberOfPlayers-1{
            print("ammount out",amountOut)
            if winProcessed == false{
                print("win not processed")
                print("2 out")
                if ishout == false{
                    hWins += 1
                    gameInProgress = false
                    print("AI1 wins")
                }
                if is2out == false{
                    AI2Wins += 1
                    gameInProgress = false
                    print("AI2 wins")
                }
            }else{
                print("all out")
                if hValues[10] > AI1Values[10]{
                    //Ai 1 wins
                    hWins += 1
                    print("h wins", hValues[10], AI1Values[10])
                }else if AI1Values[10] > hValues[10]{
                    //AI 2 wins
                    AI1Wins += 1
                    print("AI1 wins", hValues[10], AI1Values[10])
                }else{
                    print("they are equel")
                    //they are equal
                    //highcard finder iniation
                    let AI1Double = aiControler.highCardDetector(hand: hHand, handValue: hValues[10])
                    let AI2Double = aiControler.highCardDetector(hand: AI2Hand, handValue: AI2Values[10])
                    if AI1Double > AI2Double {
                        AI1Wins += 1
                        print("AI1 wins", AI1Values[10], AI2Values[10])
                    }else if AI2Double > AI1Double{
                        AI2Wins += 1
                        print("AI2 wins", AI1Values[10], AI2Values[10])
                    }else{
                        print("nobody won", AI1Values[10], AI2Values[10])
                    }

                }
            }
            gameInProgress = false
        }
    }

    }
