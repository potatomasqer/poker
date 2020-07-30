//
//  Number of people.swift
//  Poker
//
//  Created by period4 on 2/11/20.
//  Copyright © 2020 PHS. All rights reserved.
//

import UIKit

class Number_of_people: UIViewController {
    var numberOfPeople = 1
    var typeOfPoker = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        typeOfPoker = UserDefaults.value(forKey: "type") as! Int
    }
    
    
    @IBAction func two(_ sender: Any) {
        numberOfPeople = 2
        update()
    }
    @IBAction func three(_ sender: Any) {
        numberOfPeople = 3
        update()
    }
    @IBAction func four(_ sender: Any) {
        numberOfPeople = 4
        update()
        
    }
    @IBAction func five(_ sender: Any) {
        numberOfPeople = 5
        update()
    }
    @IBAction func six(_ sender: Any) {
        numberOfPeople = 6
        update()
    }
    
    func sender(){
        if typeOfPoker == 1 {
            self.navigationController!.pushViewController(BlackJack.init(), animated: true)
        }
        if typeOfPoker == 2 {
            self.navigationController!.pushViewController(TexasHoldum.init(), animated: true)
        }
        if typeOfPoker == 3 {
            self.navigationController!.pushViewController(FiveCard.init(), animated: true)
        }
        if typeOfPoker == 4 {
            self.navigationController!.pushViewController(ThreeCard.init(), animated: true)
        }
        if typeOfPoker == 5 {
            self.navigationController!.pushViewController(StraightPoker.init(), animated: true)
        }
        if typeOfPoker == 6 {
            self.navigationController!.pushViewController(sevenStud.init(), animated: true)
        }
    }
    func update(){
        let defaults = UserDefaults.standard
        defaults.setValue(numberOfPeople, forKey: "people")
    }
}



