//
//  ViewController.swift
//  Poker
//
//  Created by period4 on 2/10/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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
        let defaults = UserDefaults.standard
        defaults.setValue(typeOfPoker, forKey: "type")
        senders()
    }
    
        @IBAction func blackjack(_ sender: Any) {
        typeOfPoker = 1
    }
    @IBAction func Texas(_ sender: Any) {
        typeOfPoker = 2
    }
    @IBAction func FiveCard(_ sender: Any) {
        typeOfPoker = 3
    }
    @IBAction func threeCard(_ sender: Any) {
        typeOfPoker = 4
    }
    @IBAction func Straight(_ sender: Any) {
        typeOfPoker = 5
    }
    @IBAction func sevenStud(_ sender: Any) {
        typeOfPoker = 6
    }
    @IBAction func chinese(_ sender: Any) {
        typeOfPoker = 7
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! Number_of_people
        nvc.typeOfPoker = typeOfPoker
    }


}

