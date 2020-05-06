//
//  Potion.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/29/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

/*
Author: Christopher Pham
Date: 5-6-20
Class: Mobile Application Development

Purpose:
This programs has the potion class and all its subclasses which at this point is only heal potion. Heal potion will heal the player.

Subroutine Purpose:
 Potion:
 use and display: They are implemented in potion and to be reimplmented in their subclasses
 Heal Potion:
 use: It will increase the players current health
 display: It will show characteristics of heal potion

*/

import Foundation

class Potion : GameItem {
    var stat: String // stat to increase
    var amount: Int // the amount of points it will increased
   
    init(name: String, price: Int, description: String, stat: String, amount: Int) {
        self.stat = stat
        self.amount = amount
        super.init(name: name, price: price, description: description)
    }
    
    override func use(player: Character) {
        print("Potion is used")
    }
    
    override func display() -> String {
        return super.display() + ", Stat: \(self.stat), Amount: \(self.amount)"
    }
}


class HealPotion: Potion {
    init(name: String, price: Int, description: String, amount : Int) {
        super.init(name: name, price: price, description: description, stat: "health" ,amount: amount)
    }
    
    override func use(player: Character) {
        player.changeHealth(-self.amount)
        print(player.getCurrentHealth())
    }
}

/*

// These can be implemented later

class PernamentPotion: Potion {
    
    override init(name: String, price: Int, description: String, stat: String, amount : Int) {
        super.init(name: name, price: price, description: description, stat: stat ,amount: amount)
    }
    
    override func use(player: Character) {
        print("pernament change")
    }
}

class TemporaryPotion: Potion {
    var duration : Int
    
    init(name: String, price: Int, description: String, stat: String, amount : Int, turns: Int) {
        self.duration = turns
        super.init(name: name, price: price, description: description, stat: stat, amount: amount)
    }
    
    override func use(player: Character) {
        print("temp change")
    }
    
    override func display() -> String {
        return super.display() + ", Amount: \(self.amount), Duration: \(duration)"
    }
    
}
*/
