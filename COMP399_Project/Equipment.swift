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
        let player = (player as! Player)
        if (equipped && player.helmetEquipped == true) {
            self.equipped = false
            player.helmetEquipped = false
            super.increaseStats(type: "health", amount: self.health, entity: player )
            super.increaseStats(type: "defense", amount: self.defense, entity: player )
        } else if (!self.equipped && player.bootEquipped == false) {
            self.equipped = true
            player.helmetEquipped = true
            super.decreaseStats(type: "health", amount: self.health, entity: player )
            super.decreaseStats(type: "defense", amount: self.defense, entity: player )
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
        let player = (player as! Player)
        if (equipped && player.chestPieceEquipped == false) {
            self.equipped = false
            player.chestPieceEquipped = false
            super.increaseStats(type: "health", amount: self.health, entity: player )
            super.increaseStats(type: "defense", amount: self.defense, entity: player )
        } else if (!self.equipped && player.chestPieceEquipped == true){
            self.equipped = true
            player.chestPieceEquipped = true
            super.decreaseStats(type: "health", amount: self.health, entity: player)
            super.decreaseStats(type: "defense", amount: self.defense, entity: player)
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
        let player = (player as! Player)
        if (equipped && player.bootEquipped == true ) {
            self.equipped = false
            player.bootEquipped = false
            super.increaseStats(type: "health", amount: self.health, entity: player)
            super.increaseStats(type: "defense", amount: self.defense, entity: player)
        } else if (!self.equipped && player.bootEquipped == false) {
            self.equipped = true
            player.bootEquipped = true
            super.decreaseStats(type: "health", amount: self.health, entity: player)
            super.decreaseStats(type: "defense", amount: self.defense, entity: player)
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
        let player = (player as! Player)
        if (equipped && player.glovesEquipped == true) {
            self.equipped = false
            player.glovesEquipped = false
            super.increaseStats(type: "health", amount: self.health, entity: player)
            super.increaseStats(type: "defense", amount: self.defense, entity: player )
            super.increaseStats(type: "luck", amount: self.luck, entity: player)
        } else if (!self.equipped && player.glovesEquipped == false) {
            self.equipped = true
            player.glovesEquipped = true
            super.decreaseStats(type: "health", amount: self.health, entity: player )
            super.decreaseStats(type: "defense", amount: self.defense, entity: player )
            super.decreaseStats(type: "luck", amount: self.luck, entity: player)
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
        let player = (player as! Player)
        if (equipped && player.swordEquipped) {
            self.equipped = false
            player.swordEquipped = false
            super.increaseStats(type: "attack", amount: self.attack, entity: player)
            super.increaseStats(type: "luck", amount: self.luck, entity: player)
        } else if (!equipped && !player.swordEquipped)  {
            self.equipped = true
            player.swordEquipped = true
            super.increaseStats(type: "attack", amount: self.attack, entity: player)
            super.decreaseStats(type: "luck", amount: self.luck, entity: player)
        }
    }
    
}



