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
    var AI1hand = [0,0,0,0,0,0]
    var AI1Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI1Wins = 0
    var AI2hand = [0,0,0,0,0,0]
    var AI2Values = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var AI2Wins = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func TestStart(_ sender: UIButton) {
        for i in 1...52{
            if i != 0{
            deck.append(i)
            }
        }
        
        for _ in  0...1999{
            AI1hand = AIController.fullHandDealer(deck: deck, isItGlobal: false)
            AI2hand = AIController.fullHandDealer(deck: deck, isItGlobal: false)
            
            AI1Values = AIController.cardRemover(card1: AI1hand[0], card2: AI1hand[1], card3: AI1hand[2], card4: AI1hand[3], card5: AI1hand[4], handValue: AIController.cardValuator(card1: AI1hand[0], card2: AI1hand[1], card3: AI1hand[2], card4: AI1hand[3], card5: AI1hand[4]), visibleCards: [], nessaryValues: AI1Values, needToRemoveCards: true)
            AI2Values = AIController.cardRemover(card1: AI2hand[0], card2: AI2hand[1], card3: AI2hand[2], card4: AI2hand[3], card5: AI2hand[4], handValue: AIController.cardValuator(card1: AI2hand[0], card2: AI2hand[1], card3: AI2hand[2], card4: AI2hand[3], card5: AI2hand[4]), visibleCards: [], nessaryValues: AI2Values, needToRemoveCards: true)
            
            var removalValues = [AI1Values[11]-1, AI1Values[12]-1, AI1Values[13]-1]
            for i in 0...2{
                AI1hand[removalValues[i]] = AIController.singleCardDealer(usedDeck: deck, isItGlobal: false)
            }

            removalValues = [AI2Values[11]-1, AI2Values[12]-1, AI2Values[13]-1]
            for i in 0...2{
                AI2hand[removalValues[i]] = AIController.singleCardDealer(usedDeck: deck, isItGlobal: false)
            }
            
            if AI1cardValuator(card1: AI1hand[0], card2: AI1hand[1], card3: AI1hand[2], card4: AI1hand[3], card5: AI1hand[4]) > AI2cardValuator(card1: AI2hand[0], card2: AI2hand[1], card3: AI2hand[2], card4: AI2hand[3], card5: AI2hand[4]){
                AI1Wins += 1
                print(AI1Wins)
            }else if AI1cardValuator(card1: AI1hand[0], card2: AI1hand[1], card3: AI1hand[2], card4: AI1hand[3], card5: AI1hand[4]) < AI2cardValuator(card1: AI2hand[0], card2: AI2hand[1], card3: AI2hand[2], card4: AI2hand[3], card5: AI2hand[4]){
            AI2Wins += 1
                print(AI2Wins)
            }

        }
        print(AI1Wins,AI2Wins)
    }
    
    func AI1cardValuator(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
            
            let AIC1 = AIController.cardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                   let AIC2 = AIController.cardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                   let AIC3 = AIController.cardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
                   let AIC4 = AIController.cardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
                   let AIC5 = AIController.cardChecker(cardToCheck: card5, card2: card2, card3: card3, card4: card4, card5: card1)
                   
                   let AICValuatorArray = [AIC1, AIC2, AIC3, AIC4, AIC5]
                   var amountOfParedCards = 0
                   // addiong stuff to nessary values
        for i in 0...4{
                      if AICValuatorArray[i] == 6{
                          //streight flush
                          return 0
                          
                      }
                      if AICValuatorArray[i] == 5{
                          //quad
                          return 0
                      }
                      if AICValuatorArray[i] == 4{
                          //flush
                          return 0
                      }
                      if AICValuatorArray[i] == 3{
                          //streight
                          return 0
                      }
                      if AICValuatorArray[i] == 2{
                          //tripplet
                          for n in 0...4{
                              if n != i{
                                  if AICValuatorArray[n] == 1{
                                   //full house
                                      return 0
                                  }
                                  return 0
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
                          return 0
                      }else if amountOfParedCards == 2{
                          // pair
                          return 4
                  }
        return 0
    }
    func AI2cardValuator(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
            
            let AIC1 = AIController.cardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                   let AIC2 = AIController.cardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                   let AIC3 = AIController.cardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
                   let AIC4 = AIController.cardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
                   let AIC5 = AIController.cardChecker(cardToCheck: card5, card2: card2, card3: card3, card4: card4, card5: card1)
                   
                   let AICValuatorArray = [AIC1, AIC2, AIC3, AIC4, AIC5]
                   var amountOfParedCards = 0
                   // addiong stuff to nessary values
        for i in 0...4{
                      if AICValuatorArray[i] == 6{
                          //streight flush
                          return 0
                          
                      }
                      if AICValuatorArray[i] == 5{
                          //quad
                          return 0
                      }
                      if AICValuatorArray[i] == 4{
                          //flush
                          return 0
                      }
                      if AICValuatorArray[i] == 3{
                          //streight
                          return 0
                      }
                      if AICValuatorArray[i] == 2{
                          //tripplet
                          for n in 0...4{
                              if n != i{
                                  if AICValuatorArray[n] == 1{
                                   //full house
                                      return 0
                                  }
                                  return 0
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
                          return 8
                      }else if amountOfParedCards == 2{
                          // pair
                          return 0
                  }
        return 0
    }

}
