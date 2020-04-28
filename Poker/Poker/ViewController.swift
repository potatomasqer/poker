//
//  ViewController.swift
//  Poker
//
//  Created by period4 on 2/10/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var AIController = AI()
    
    
    var typeOfPoker = 0
    //autosave funcs
    func senders(){
    if typeOfPoker == 1{
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "blackJack")
        show(nextVC, sender: self)
        
    }else if typeOfPoker == 2{
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "TexasHoldum")
        show(nextVC, sender: self)

    }else if typeOfPoker == 3{
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "FiveCard")
        show(nextVC, sender: self)
        
    }else if typeOfPoker == 4{
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "ThreeCard")
        show(nextVC, sender: self)
        
    }else if typeOfPoker == 5{
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "StraightPoker")
        show(nextVC, sender: self)
        
    }else if typeOfPoker == 6{
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "sevenStud")
        show(nextVC, sender: self)
        
    }else if typeOfPoker == 7{
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "chinese")
        show(nextVC, sender: self)
        
        }
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //if in match
        senders()
    }
    let defaults = UserDefaults.standard
        @IBAction func blackjack(_ sender: Any) {
        typeOfPoker = 1
        defaults.setValue(typeOfPoker, forKey: "type")

    }
    @IBAction func Texas(_ sender: Any) {
        typeOfPoker = 2
        defaults.setValue(typeOfPoker, forKey: "type")

    }
    @IBAction func FiveCard(_ sender: Any) {
        typeOfPoker = 3
        defaults.setValue(typeOfPoker, forKey: "type")

    }
    @IBAction func threeCard(_ sender: Any) {
        typeOfPoker = 4
        defaults.setValue(typeOfPoker, forKey: "type")

    }
    @IBAction func Straight(_ sender: Any) {
        typeOfPoker = 5
        defaults.setValue(typeOfPoker, forKey: "type")

    }
    @IBAction func sevenStud(_ sender: Any) {
        typeOfPoker = 6
        defaults.setValue(typeOfPoker, forKey: "type")

    }
    @IBAction func chinese(_ sender: Any) {
        typeOfPoker = 7
        defaults.setValue(typeOfPoker, forKey: "type")

    }


}

