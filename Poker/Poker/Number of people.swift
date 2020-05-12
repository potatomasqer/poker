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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
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
    
    
    
    
    func update(){
        let defaults = UserDefaults.standard
        defaults.setValue(numberOfPeople, forKey: "people")
    }
}


