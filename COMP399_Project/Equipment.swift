//
//  Equipment.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/29/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import Foundation

class Equipment : GameItem {
    var grade : String
    var equipped: Bool
    
    init(name: String, price: Int, description: String, rarity: String) {
        self.grade = rarity
        self.equipped = false
        super.init(name: name, price: price, description: description)
    }
    
    override func use(player: Character) {
        // can make generic method that goes through all stat changes and applies them
        self.equipped = true
    }
    
    override func display() -> String {
        return super.display() + ", Grade: \(self.grade), Equipped: \(self.equipped)"
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
    
    override func use(player: Character) {
        if (equipped) {
            self.equipped = false
            super.increaseStats(type: "health", amount: self.health, entity: player as! Player)
            super.increaseStats(type: "defense", amount: self.defense, entity: player as! Player)
        } else {
            self.equipped = true
            super.decreaseStats(type: "health", amount: self.health, entity: player as! Player)
            super.decreaseStats(type: "defense", amount: self.defense, entity: player as! Player)
        }
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
    
    override func use(player: Character) {
        if (equipped) {
            self.equipped = false
            super.increaseStats(type: "health", amount: self.health, entity: player as! Player)
            super.increaseStats(type: "defense", amount: self.defense, entity: player as! Player)
        } else {
            self.equipped = true
            super.decreaseStats(type: "health", amount: self.health, entity: player as! Player)
            super.decreaseStats(type: "defense", amount: self.defense, entity: player as! Player)
        }
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
    
    override func use(player: Character) {
        if (equipped) {
            self.equipped = false
            super.increaseStats(type: "health", amount: self.health, entity: player as! Player)
            super.increaseStats(type: "defense", amount: self.defense, entity: player as! Player)
        } else {
            self.equipped = true
            super.decreaseStats(type: "health", amount: self.health, entity: player as! Player)
            super.decreaseStats(type: "defense", amount: self.defense, entity: player as! Player)
        }
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
    
    override func use(player: Character) {
        if (equipped) {
            self.equipped = false
            super.increaseStats(type: "health", amount: self.health, entity: player as! Player)
            super.increaseStats(type: "defense", amount: self.defense, entity: player as! Player)
            super.increaseStats(type: "luck", amount: self.luck, entity: player as! Player)
        } else {
            self.equipped = true
            super.decreaseStats(type: "health", amount: self.health, entity: player as! Player)
            super.decreaseStats(type: "defense", amount: self.defense, entity: player as! Player)
            super.decreaseStats(type: "luck", amount: self.luck, entity: player as! Player)
        }
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
    
    override func use(player: Character) {
        if (equipped) {
            self.equipped = false
            super.increaseStats(type: "attack", amount: self.attack, entity: player as! Player)
            super.increaseStats(type: "luck", amount: self.luck, entity: player as! Player)
        } else {
            self.equipped = true
            super.increaseStats(type: "attack", amount: self.attack, entity: player as! Player)
            super.decreaseStats(type: "luck", amount: self.luck, entity: player as! Player)
        }
    }
    
}



