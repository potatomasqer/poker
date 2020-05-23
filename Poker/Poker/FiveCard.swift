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
    var ifRasedThisTurn = false
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
    var hCashLeft = 0
    //choice
    //1 fold 2 call 3 raise
    var hChoice = 0
    
    //AI's max of 6 AI's
    //AI 1
    //cards
    var AI1Hand = [Int]()
    var AITotalBet1 = 0
    var AI1Cashleft = 0
    var AIChoice1 = 0
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 Ai Choice
    var AI1Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI1VisableCards = [Int]()
    
    //AI 2
    var AI2Hand = [Int]()
    var AITotalBet2 = 0
    var AI2Cashleft = 0
    var AIChoice2 = 0
    
    //0...4 cards, 5...9 card values, 10 hand value, 11...13 cards to trade in,14 score AI wants ,15 Ai Choice
    var AI2Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI2VisableCards = [Int]()
    
    
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
                        }
                        alert.addAction(done)
                        present(alert, animated: true)
                    }
                    // 3 options rase call fold
                    //rase rases the pot by x amount
                    //call rases your bet to the current amount
                    //if you dont call you are forced to fold
                    //if you dont have any mony not in the pot you are all in
                    //fold shows your cards and kiks you out of the game
                    
                    
                }else if i == 1{
                    //Ai 1
                    //check handvalue
                    if whatRoundIsIt == 1{
                        AI1Values[10] = aiControler.cardValuator(card1: AI1Hand[0], card2: AI1Hand[1], card3: AI1Hand[2], card4: AI1Hand[3], card5: AI1Hand[4])
                        aiControler.AITurn(hand: AI1Hand, handValue: AI1Values[10], howManyCardsInHand: 5, howManyPlayers: numberOfPlayers, ifRaisedThisTurn: ifRasedThisTurn, canRemoveCards: true, howManyRemovedCards: 3, visableCards: [], nessaryValues: AI1Values, gameDeck: gameDeck, AILV: 1)
                    }
                    //AI1 turn end
                }
            }
            whatRoundIsIt += 1
        }
        if numberOfActivePlayers == 1{
            //end game with active player as winner
        }
    }
    
    func betterThenOponent(hand:Array<Int>,handValue:Int,visableCards:Array<Int>)->Bool{
        // top 1/numberOfplayers%
        
        return true
    }
}
