//
//  Potion.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/29/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import Foundation



class Potion : GameItem {
    var stat: String
    var amount: Int
   
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

