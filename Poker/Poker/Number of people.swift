//
//  Number of people.swift
//  Poker
//
//  Created by period4 on 2/11/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class Number_of_people: UIViewController {
    var nav = UINavigationController()
    var typeOfPoker = 0
    var numberOfPeople = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    
    @IBAction func two(_ sender: Any) {
        numberOfPeople = 2
        update()
        senders()
    }
    @IBAction func three(_ sender: Any) {
        numberOfPeople = 3
        update()
        senders()
    }
    @IBAction func four(_ sender: Any) {
        numberOfPeople = 4
        update()
        senders()
    }
    @IBAction func five(_ sender: Any) {
        numberOfPeople = 5
        update()
        senders()
    }
    @IBAction func six(_ sender: Any) {
        numberOfPeople = 6
        update()
        senders()
    }
    
    
    
    
    func update(){
        let defaults = UserDefaults.standard
        defaults.setValue(typeOfPoker, forKey: "type")
        defaults.setValue(numberOfPeople, forKey: "people")
    }
    
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
}


