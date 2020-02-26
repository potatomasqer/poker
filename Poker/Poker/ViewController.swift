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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

