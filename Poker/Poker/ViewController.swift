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
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

