//
//  Equipment.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/29/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import Foundation

class Equipment : Item {
    var grade : String
    
    init(name: String, price: Int, description: String, rarity: String) {
        self.grade = rarity
        super.init(name: name, price: price, description: description)
    }
    
    override func use(player: Any) {
        // can make generic method that goes through all stat changes and applies them
        print("Equipment is equipped")
    }
    
    override func display() -> String {
        return super.display() + ", Grade: \(self.grade)"
    }
}

class Helmet : Equipment {
    var health : Int
    var defense : Int
    init(name: String, price: Int, description: String, rarity: String, health: Int, defense: Int) {
        self.defense = defense
        self.health = health
        super.init(name: name, price: price, description: description, rarity: rarity)
    }
}

class ChestPiece : Equipment {
    var health : Int
    var defense : Int
    init(name: String, price: Int, description: String, rarity: String, health: Int, defense: Int) {
        self.defense = defense
        self.health = health

        super.init(name: name, price: price, description: description, rarity: rarity)
    }
}

class Boot : Equipment {
    var health : Int
    var defense : Int
    init(name: String, price: Int, description: String, rarity: String, health: Int, defense: Int) {
        self.defense = defense
        self.health = health

        super.init(name: name, price: price, description: description, rarity: rarity)
    }
}

class Gloves : Equipment {
    var health : Int
    var defense : Int
    var luck : Int
    init(name: String, price: Int, description: String, rarity: String, health: Int, defense: Int, luck: Int) {
        self.defense = defense
        self.health = health
        self.luck = luck
        super.init(name: name, price: price, description: description, rarity: rarity)
    }
}

class Sword : Equipment {
    var attack : Int
    var luck : Int
    
    init(name: String, price: Int, description: String, rarity: String, attack: Int, luck: Int) {
        self.attack = attack
        self.luck = luck
        super.init(name: name, price: price, description: description, rarity: rarity)
    }
}



