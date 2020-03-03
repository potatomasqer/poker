//
//  AI.swift
//  Poker
//
//  Created by period4 on 2/21/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class AI {
    
    func AI(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int )->Int{
        // func inside func
        
        
        func singleCardChecker(cardToCheck: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
            if card5 != nil{
            if cardToCheck == card2 && cardToCheck == card3 && cardToCheck == card4{
                //quad
                return 6
            }else if cardToCheck == card2 && cardToCheck == card3 && cardToCheck == card5{
                //quad
                return 6
            }else if cardToCheck == card2 && cardToCheck == card5 && cardToCheck == card4{
                //quad
                return 6
            }else if cardToCheck == card5 && cardToCheck == card3 && cardToCheck == card4{
                //quad
                return 6
            }else if ((cardToCheck%13 - 1) == card2%13 && (card2%13 - 1) == card3%13 && (card3%13 - 1) == card4%13 && (card4%13 - 1) == card5%13) && (cardToCheck%4 == card2%4 && cardToCheck%4 == card3%4 && cardToCheck%4 == card5%4){
                //straight flush
                return 5
            }else if (cardToCheck - 1) == card2 && (card2 - 1) == card3 && (card3 - 1) == card4 && (card4 - 1) == card5{
                //straight
                return 3
            }else if cardToCheck%4 == card2%4 && cardToCheck%4 == card3%4 && cardToCheck%4 == card4%4 && cardToCheck%4 == card5{
                //flush
                return 4
            }else if cardToCheck == card2  && cardToCheck == card3{
                //triplet
                return 2
            }else if cardToCheck == card2  && cardToCheck == card4{
                //triplet
                return 2
            }else if cardToCheck == card2  && cardToCheck == card5{
                //triplet
                return 2
            }else if cardToCheck == card3  && cardToCheck == card4{
                //triplet
                return 2
            }else if cardToCheck == card3  && cardToCheck == card5{
                //triplet
                return 2
            }else if cardToCheck == card4  && cardToCheck == card5{
                //triplet
                return 2
            }else if cardToCheck == card2{
                //pair
                return 1
            }else if cardToCheck == card3{
                //pair
                return 1
            }else if cardToCheck == card4{
                //pair
                return 1
            }else if cardToCheck == card4{
                //pair
                return 1
            }else{
                return 0
                }

            }else if card4 != nil{
                if ((cardToCheck%13 - 1) == card2%13 && (card2%13 - 1) == card3%13 && (card3%13 - 1) == card4%13) && (cardToCheck%4 == card2%4 && cardToCheck%4 == card3%4 && cardToCheck%4 == card4%4){
                    //straight flush
                    return 5
                }else if (cardToCheck - 1) == card2 && (card2 - 1) == card3 && (card3 - 1) == card4{
                    //straight
                    return 3
                }else if cardToCheck%4 == card2%4 && cardToCheck%4 == card3%4 && cardToCheck%4 == card4%4{
                    //flush
                    return 4
                }else if cardToCheck == card2  && cardToCheck == card3{
                    //triplet
                    return 2
                }else if cardToCheck == card2  && cardToCheck == card4{
                    //triplet
                    return 2
                }else  if cardToCheck == card3  && cardToCheck == card4{
                    //triplet
                    return 2
                }else  if cardToCheck == card2{
                    //pair
                    return 1
                }else if cardToCheck == card3{
                    //pair
                    return 1
                }else if cardToCheck == card4{
                    //pair
                    return 1
                }else {
                    return 0
                    }
            }else if card3 != nil{
            if ((cardToCheck%13 - 1) == card2%13 && (card2%13 - 1) == card3%13 ) && (cardToCheck%4 == card2%4 && cardToCheck%4 == card3%4){
                //straight flush
                return 5
            }else if (cardToCheck - 1) == card2 && (card2 - 1) == card3 {
                //straight
                return 3
            }else if cardToCheck%4 == card2%4 && cardToCheck%4 == card3%4 {
                //flush
                return 4
            }else if cardToCheck == card2  && cardToCheck == card3{
                //triplet
                return 2
            }else   if cardToCheck == card2{
                //pair
                return 1
            }else if cardToCheck == card3{
                //pair
                return 1
            }else  {
                return 0
                }
            }else if card2 != nil{
            if ((cardToCheck%13 - 1) == card2%13 ) && (cardToCheck%4 == card2%4 ){
                //straight flush
                return 5
            }else if (cardToCheck - 1) == card2  {
                //straight
                return 3
            }else if cardToCheck%4 == card2%4  {
                //flush
                return 4
            }else if cardToCheck == card2{
                //pair
                return 1
            }else{
                return 0
                }
            }

            return 0
        }
        func cardComboChecker(card1: Int, card2: Int, card3: Int, card4: Int, card5: Int)-> Int{
           //combos
            // proportion of card # and any card
            let PO1AA = singleCardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
            let PO2AA = singleCardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
            let PO3AA = singleCardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
            let PO4AA = singleCardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
            let PO5AA = singleCardChecker(cardToCheck: card5, card2: card2, card3: card3, card4: card4, card5: card1)

            //combo combos
            if PO1AA == 6{
                //only
            }else if PO2AA == 6{
                //only
            }else if PO3AA == 6{
                //only
            }else  if PO4AA == 6{
                //only
            }else if PO5AA == 6{
                //only
            }else
                
                if PO1AA == 5{
                //Top
            }else if PO2AA == 5{
            //Top
            }else if PO3AA == 5{
            //Top
            }else if PO4AA == 5{
            //Top
            }else if PO5AA == 5{
            //Top
            }else
            if PO1AA == 4{
             //all equal
            }else if PO1AA == 3{
            //Top
            }else if PO2AA == 3{
            //Top
             }else if PO3AA == 3{
            //Top
            }else if PO4AA == 3{
            //Top
            }else if PO5AA == 3{
             //Top
            }else
                if PO1AA == 2{
                //Tripplet
                    //checking for dubble
                    if PO2AA == 1{
                        //full house
                    }else if PO3AA == 1{
                        //full house
                    }else if PO4AA == 1{
                        //full house
                    }else if PO5AA == 1{
                        //full house
                    }else {
                        //no dubble
                    }

            }else if PO2AA == 2{
            //Tripplet
                    //checking for dubble
                    if PO1AA == 1{
                        //full house
                    }else if PO3AA == 1{
                        //full house
                    }else if PO4AA == 1{
                        //full house
                    }else if PO5AA == 1{
                        //full house
                    }else {
                        //no dubble
                    }
            }else if PO3AA == 2{
            //Tripplet
                    //checking for dubble
                    if PO2AA == 1{
                        //full house
                    }else if PO1AA == 1{
                        //full house
                    }else if PO4AA == 1{
                        //full house
                    }else if PO5AA == 1{
                        //full house
                    }else {
                        //no dubble
                    }
            }else if PO4AA == 2{
            //Tripplet
                    //checking for dubble
                    if PO2AA == 1{
                        //full house
                    }else if PO3AA == 1{
                        //full house
                    }else if PO1AA == 1{
                        //full house
                    }else if PO5AA == 1{
                        //full house
                    }else {
                        //no dubble
                    }
            }else if PO5AA == 2{
            //Tripplet
                    //checking for dubble
                    if PO2AA == 1{
                        //full house
                    }else if PO3AA == 1{
                        //full house
                    }else if PO4AA == 1{
                        //full house
                    }else if PO1AA == 1{
                        //full house
                    }else {
                        //no dubble
                    }
                }else {
                    
            }
            
            return 0
        }
        
        let cardValue = cardComboChecker(card1: card1, card2: card2, card3: card3, card4: card4, card5: card5)
        
        if cardValue <= 4{
                        
            if card5 != nil{
                let betterCard1 = singleCardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                let betterCard2 = singleCardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                let betterCard3 = singleCardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
                let betterCard4 = singleCardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
                let betterCard5 = singleCardChecker(cardToCheck: card5, card2: card2, card3: card3, card4: card4, card5: card1)

            }else if card4 != nil{
                let betterCard1 = singleCardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                let betterCard2 = singleCardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                let betterCard3 = singleCardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
                let betterCard4 = singleCardChecker(cardToCheck: card4, card2: card2, card3: card3, card4: card1, card5: card5)
                
                
            }else if card3 != nil{
                let betterCard1 = singleCardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                let betterCard2 = singleCardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                let betterCard3 = singleCardChecker(cardToCheck: card3, card2: card2, card3: card1, card4: card4, card5: card5)
                
            }else if card2 != nil{
                let betterCard1 = singleCardChecker(cardToCheck: card1, card2: card2, card3: card3, card4: card4, card5: card5)
                let betterCard2 = singleCardChecker(cardToCheck: card2, card2: card1, card3: card3, card4: card4, card5: card5)
                
            }else{
                
            }



            
            
        }
        return cardValue
    }

}
