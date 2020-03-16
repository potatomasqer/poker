//
//  AI.swift
//  Poker
//
//  Created by period4 on 2/21/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class AI {
    
    func AI(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int, AllIn: Bool, roundsPlayed: Int,prevousGames: Array<Int> )-> Int{
        // func inside func
        var AICards = [Int]()
        var endChoice = 0
        AICards = [card1, card2, card3, card4, card5]
        AICards.sort()
        
        func cardChecker(cardToCheck: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
            if card5 != 0{
                for i in 0...4{
                    let card1Location = AICards.firstIndex(of: cardToCheck)
                    //arrays
                    var AIHandNumbers = [AICards[0]%13, AICards[1]%13, AICards[2]%13,AICards[3]%13,AICards[4]%13]
                    AIHandNumbers.sort()
                    var AISuitNumbers =   [AICards[0]/1, AICards[1]/13, AICards[2]/13,AICards[3]/13,AICards[4]/13]
                    AISuitNumbers.sort()
                    
                    //importent varables
                    var amountPairedWith = 0
                    var foundStraight = false
                    var amountFlushedWith = 0
                    
                    //only caounts if it is not compariong to itself
                    if i != card1Location{
                        print(i,card1Location!)
                        
                        if cardToCheck == AIHandNumbers[i]{
                            //number of cards with the same number
                            // findes pares, triplits and quads
                            amountPairedWith += 1
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
                    if amountPairedWith == 4{
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
                    if amountPairedWith == 3{
                        //triplet
                        return 2
                    }
                    if amountPairedWith == 2{
                        return 1
                    }
                    
                }
            }else if card4 != 0{
                
                for i in 0...3{
                    let card1Location = AICards.firstIndex(of: cardToCheck)
                    AICards.sort()
                    AICards.removeFirst()
                    
                    var AIHandNumbers = [AICards[0]%13, AICards[1]%13, AICards[2]%13,AICards[3]%13]
                    AIHandNumbers.sort()
                    var AISuitNumbers =   [AICards[0]/4, AICards[1]/4, AICards[2]/4,AICards[3]/4,]
                    AISuitNumbers.sort()
                    
                    //importent varables
                    var amountPairedWith = 0
                    var foundStraight = false
                    var amountFlushedWith = 0
                    
                    //only caounts if it is not compariong to itself
                    if i != card1Location{
                        print(i,card1Location!)
                        
                        if cardToCheck == AIHandNumbers[i]{
                            //number of cards with the same number
                            // findes pares, triplits and quads
                            amountPairedWith += 1
                        }
                        if cardToCheck/4 == AISuitNumbers[i]{
                            //number of cards in the same suit
                            //trys to find a flush
                            amountFlushedWith += 1
                        }
                        
                        if  AIHandNumbers[0]-1 == AIHandNumbers[1] && AIHandNumbers[1]-1 == AIHandNumbers[2] && AIHandNumbers[2]-1 == AIHandNumbers[3]{
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
                    }else if amountFlushedWith == 3{
                        //flush
                        return 4
                    }else if foundStraight == true{
                        //straight
                        return 3
                    }
                    if amountPairedWith == 3{
                        //triplet
                        return 2
                    }
                    if amountPairedWith == 2{
                        return 1
                    }
                    
                }


            }else if card3 != 0{
                AICards.sort()
                AICards.removeFirst()
                AICards.removeFirst()
                for i in 0...2{
                    let card1Location = AICards.firstIndex(of: cardToCheck)
                    //arrays
                    var AIHandNumbers = [AICards[0]%13, AICards[1]%13, AICards[2]%13]
                    AIHandNumbers.sort()
                    var AISuitNumbers =   [AICards[0]/4, AICards[1]/4, AICards[2]/4]
                    AISuitNumbers.sort()
                    
                    //importent varables
                    var amountPairedWith = 0
                    var foundStraight = false
                    var amountFlushedWith = 0
                    
                    //only caounts if it is not compariong to itself
                    if i != card1Location{
                        print(i,card1Location!)
                        
                        if cardToCheck == AIHandNumbers[i]{
                            //number of cards with the same number
                            // findes pares, triplits and quads
                            amountPairedWith += 1
                        }
                        if cardToCheck/4 == AISuitNumbers[i]{
                            //number of cards in the same suit
                            //trys to find a flush
                            amountFlushedWith += 1
                        }
                        
                        if  AIHandNumbers[0]-1 == AIHandNumbers[1] && AIHandNumbers[1]-1 == AIHandNumbers[2]{
                            //findes straight
                            foundStraight = true
                        }
                        
                        
                    }
                    // results to return
                    
                    if foundStraight == true && amountFlushedWith == 2{
                        //straight flush
                        return 4
                    }else if amountFlushedWith == 2{
                        //flush
                        return 4
                    }else if foundStraight == true{
                        //straight
                        return 3
                    }
                    if amountPairedWith == 3{
                        //triplet
                        return 2
                    }
                    if amountPairedWith == 2{
                        return 1
                    }
                    
                }

            }else if card2 != 0{
                AICards.sort()
                AICards.removeFirst()
                AICards.removeFirst()
                AICards.removeFirst()
                for i in 0...1{
                    let card1Location = AICards.firstIndex(of: cardToCheck)
                    //arrays
                    var AIHandNumbers = [AICards[0]%13, AICards[1]%13]
                    AIHandNumbers.sort()
                    var AISuitNumbers =   [AICards[0]/4, AICards[1]/4]
                    AISuitNumbers.sort()
                    
                    //importent varables
                    var amountPairedWith = 0
                    var foundStraight = false
                    var amountFlushedWith = 0
                    
                    //only caounts if it is not compariong to itself
                    if i != card1Location{
                        print(i,card1Location!)
                        
                        if cardToCheck == AIHandNumbers[i]{
                            //number of cards with the same number
                            // findes pares, triplits and quads
                            amountPairedWith += 1
                        }
                        if cardToCheck/4 == AISuitNumbers[i]{
                            //number of cards in the same suit
                            //trys to find a flush
                            amountFlushedWith += 1
                        }
                        
                        if  AIHandNumbers[0]-1 == AIHandNumbers[1]{
                            //findes straight
                            foundStraight = true
                        }
                        
                        
                    }
                    // results to return
                    if foundStraight == true && amountFlushedWith == 1{
                        //straight flush
                        return 6
                    }else if amountFlushedWith == 1{
                        //flush
                        return 4
                    }else if foundStraight == true{
                        //straight
                        return 3
                    }
                    if amountPairedWith ==  1{
                        return 1
                    }
                }
            }
            return 0
        }
        
        func cardValuator(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
            let AIC1 = cardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
            let AIC2 = cardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
            let AIC3 = cardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
            let AIC4 = cardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
            let AIC5 = cardChecker(cardToCheck: card5, card2: card2, card3: card3, card4: card4, card5: card1)
            
            var AICValuatorArray = [AIC1, AIC2, AIC3, AIC4, AIC5]
            AICValuatorArray.sort()
            var amountOfParedCards = 0
            
            if card5 != 0 {
                
                
                for i in 0...4{
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
                    }else if amountOfParedCards == 2{
                        // pair
                        return 1
                    }
                    
                    
                }
            }else if card4 != 0{
                for i in 0...4{
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
                                  if amountOfParedCards == 4{
                                      //dubble pair
                                      return 2
                                  }else if amountOfParedCards == 2{
                                      // pair
                                      return 1
                                  }
                                  
                                  
                              }
            }else if card3 != 0{
                for i in 0...4{
                if AICValuatorArray[i] == 6{
                    //streight flush
                    return 5
                    
                }
                if AICValuatorArray[i] == 4{
                    //flush
                    return 4
                }
                if AICValuatorArray[i] == 3{
                    //streight
                    return 3
                }
                if AICValuatorArray[i] == 2{
                    //tripplet
                  return 2
                }
                if AICValuatorArray[i] == 1{
                    //parir
                amountOfParedCards += 1
                }
                    if amountOfParedCards == 2{
                    // pair
                    return 1
                }
            }
            }else if card2 != 0{
            for i in 0...4{
                if AICValuatorArray[i] == 6{
                    //streight flush
                    return 5
                    
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
                if amountOfParedCards == 2{
                // pair
                return 1
                }
            }
            }else{
            //cards are useless
            return 0
            }
            return 0
        }
        
        
        
        //desider
        func desider(valuatedCardes: Int)-> Int{
            let cardValue  = cardValuator(card1: card1, card2: card2, card3: card3, card4: card4, card5: card5)
            //deside 1 to 3
            //1 is call
            //2 is rase
            //3 is fold
            if AllIn == true {
                return 1
            }
            if cardValue >= 6{
                return 2
            }
            if cardValue >= 2 && roundsPlayed <= 5{
                return 1
            }else if cardValue >= 2 && roundsPlayed > 5{
                return 3
            }
            
            
        return 3
        }
        
        endChoice = desider(valuatedCardes: cardValuator(card1: card1, card2: card2, card3: card3, card4: card4, card5: card5))
        return endChoice
        
        
        
        
    }
    
    
}
