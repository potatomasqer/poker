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
    var numberOfActivePlayers = 0
    var activePlayers = [Int]()
    var noBetRaise = false
    var whatTurnIsIt = 1
    var whatRoundIsIt = 1
    var globalVisableCards = [Int]()
    //local varables
    //human player
    //cards
    var hCard1 = 0
    var hCard2 = 0
    var hCard3 = 0
    var hCard4 = 0
    var hCard5 = 0
    var hHand = [Int]()
    var hTotalBet = 0
    //choice
    //1 fold 2 call 3 raise
    var hChoice = 0
    
    //AI's max of 6 AI's
    //AI 1
    //cards
    var AI1Hand = [Int]()
    var AITotalBet1 = 0
    var AIChoice1 = 0
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 chance opponent has a better card
    var AI1Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI1VisableCards = [Int]()
    
    //AI 2
    var AI2Hand = [Int]()
    var AITotalBet2 = 0
    var AIChoice2 = 0
    
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 chance opponent has a better card
    var AI2Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI2VisableCards = [Int]()
    
    
    //AI 3
    var AI3Hand = [Int]()
    var AITotalBet3 = 0
    var AIChoice3 = 0
    
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 chance opponent has a better card
    var AI3Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI3VisableCards = [Int]()

    //AI 4
    var AI4Hand = [Int]()
    var AITotalBet4 = 0
    var AIChoice4 = 0
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 chance opponent has a better card
    var AI4Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI4VisableCards = [Int]()

    //AI 5
    var AI5Hand = [Int]()
    var AITotalBet5 = 0
    
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 chance opponent has a better card
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
        for i in 1...numberOfPlayers{
            activePlayers.append(i)
        }
        while numberOfActivePlayers < 1 || noBetRaise != true{
            for i in 0...numberOfPlayers-1{
                // 0 human 1 ai1 2 ai2...
                whatTurnIsIt = i
                if i == 0{
                    //human turn
                    //wait for choice..
                    //actions
                    //includes 3 options for the player that trigger flags and moves on
                    //if it is round one then card actions become avalable
                    //cards are images you can interact with on the first round
                    //you can slect up to 3 cards to throw away.
                    if whatRoundIsIt == 1{
                        //first round
                        
                    }
                    
                }else if i == 1{
                    //Ai 1
                    //check handvalue
                    AI1Values[10] = aiControler.cardValuator(card1: AI1Hand[0], card2: AI1Hand[1], card3: AI1Hand[2], card4: AI1Hand[3], card5: AI1Hand[4])
                    let oldHandValue = AI1Values[10]
                    if whatRoundIsIt == 1{
                      AI1Values  =  aiControler.cardRemover(card1: AI1Hand[0], card2: AI1Hand[1], card3: AI1Hand[2], card4: AI1Hand[3], card5: AI1Hand[4], handValue: AI1Values[10], visibleCards: AI1VisableCards, nessaryValues: AI1Values, needToRemoveCards: true)
                        for i in 0...2{
                            if AI1Values[11+i] != 0{
                                AI1Hand[AI1Values[11+i]] = aiControler.singleCardDealer(usedDeck: gameDeck, isItGlobal: true)
                                gameDeck = UserDefaults.standard.array(forKey: "GlobalDeck") as! [Int]
                            }
                        }
                        //recheck hand value
                        let newHandValue = aiControler.cardValuator(card1: AI1Hand[0], card2: AI1Hand[1], card3: AI1Hand[2], card4: AI1Hand[3], card5: AI1Hand[4])
                        if newHandValue >= oldHandValue{
                            //better or equel to
                            //stay in game
                        }
                    }else if whatRoundIsIt != 1{
                        
                    }
                    //AI turn end
                }
            }
            whatRoundIsIt += 1
        }
        if numberOfActivePlayers == 1{
            //end game with active player as winner
        }
    }
    
    func betterThenOponent(hand:Array<Int>,handValue:Int,visableCards:Array<Int>)->Bool{
        //avarge 3??
        
        return true
    }
}
