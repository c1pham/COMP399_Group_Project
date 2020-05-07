//
//  Equipment.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/29/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//


/*
Author: Christopher Pham
Editor: Brendan Mendes
Date: 5-6-20
Class: Mobile Application Development

Purpose:
This is equipment superclass class for all equipment. All equipment need the property to be equipped and will have an rarity. Afterwards each subclass of equipment is made here. They will adjust the stats of the users when equipped or taken off.

Subroutine Purpose:

 Equipment Class:
 use: This will equip the item to the user and adjust their stats

 display: it will show the attributes of the equipment.

 All subclasses of equipment implement the use function and increase stats according to what is received through the constructor. Some subclasses increase luck some increase defense or some other attribute.

 All subclasses of equipment implment display and they will show all their attributes
 

*/
import Foundation


class Equipment : GameItem {
    var grade : String // the rarity of the item
    var equipped: Bool // bool to know if item is equipped or not
    
    init(name: String, price: Int, description: String, rarity: String) {
        self.grade = rarity
        self.equipped = false // item cannot be equipped at first
        super.init(name: name, price: price, description: description)
    }
    
    override func use(player: Character) {
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
        if (equipped && player.armorEquipped[0] == true) { // checks if the item is equipped and if the the player has an helmet is equipped, if so then de equipped and player's reduce stats
            self.equipped = false
            player.armorEquipped[0] = false
            super.decreaseStats(type: "health", amount: self.health, entity: player )
            super.decreaseStats(type: "defense", amount: self.defense, entity: player )
        } else if (!self.equipped && player.armorEquipped[0] == false) { // checks if the item is not equipped and if the the player has an helmet is not equipped, if so then equipped item and increase stats
            self.equipped = true
            player.armorEquipped[0] = true
            super.increaseStats(type: "health", amount: self.health, entity: player )
            super.increaseStats(type: "defense", amount: self.defense, entity: player )
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
        if (equipped && player.armorEquipped[1] == true) { // checks if the item is equipped and if the the player has an helmet is equipped, if so then de equipped and player's reduce stats
            self.equipped = false
            player.armorEquipped[1] = false
            super.decreaseStats(type: "health", amount: self.health, entity: player)
            super.decreaseStats(type: "defense", amount: self.defense, entity: player)
        } else if (!self.equipped && player.armorEquipped[1] == false){  // checks if the item is not equipped and if the the player has an helmet is not equipped, if so then equipped item and increase stats
            self.equipped = true
            player.armorEquipped[1] = true
            super.increaseStats(type: "health", amount: self.health, entity: player )
            super.increaseStats(type: "defense", amount: self.defense, entity: player )
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
        if (equipped && player.armorEquipped[3] == true ) { // checks if the item is equipped and if the the player has an helmet is equipped, if so then de equipped and player's reduce stats
            self.equipped = false
            player.armorEquipped[3] = false
            super.decreaseStats(type: "health", amount: self.health, entity: player)
            super.decreaseStats(type: "defense", amount: self.defense, entity: player)
        } else if (!self.equipped && player.armorEquipped[3] == false) { // checks if the item is not equipped and if the the player has an helmet is not equipped, if so then equipped item and increase stats
            self.equipped = true
            player.armorEquipped[3] = true
            super.increaseStats(type: "health", amount: self.health, entity: player)
            super.increaseStats(type: "defense", amount: self.defense, entity: player)
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
        if (equipped && player.armorEquipped[2] == true) { // checks if the item is equipped and if the the player has an helmet is equipped, if so then de equipped and player's reduce stats
            self.equipped = false
            player.armorEquipped[2] = false
            super.decreaseStats(type: "health", amount: self.health, entity: player )
            super.decreaseStats(type: "defense", amount: self.defense, entity: player )
            super.decreaseStats(type: "luck", amount: self.luck, entity: player)
        } else if (!self.equipped && player.armorEquipped[2] == false) { // checks if the item is not equipped and if the the player has an helmet is not equipped, if so then equipped item and increase stats
            self.equipped = true
            player.armorEquipped[2] = true
            super.increaseStats(type: "health", amount: self.health, entity: player)
            super.increaseStats(type: "defense", amount: self.defense, entity: player )
            super.increaseStats(type: "luck", amount: self.luck, entity: player)
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
        if (equipped && player.swordEquipped) { // checks if the item is equipped and if the the player has an helmet is equipped, if so then de equipped and player's reduce stats
            self.equipped = false
            player.swordEquipped = false
            super.decreaseStats(type: "attack", amount: self.attack, entity: player)
            super.decreaseStats(type: "luck", amount: self.luck, entity: player)
        } else if (!equipped && !player.swordEquipped)  { // checks if the item is not equipped and if the the player has an helmet is not equipped, if so then equipped item and increase stats
            self.equipped = true
            player.swordEquipped = true
            super.increaseStats(type: "attack", amount: self.attack, entity: player)
            super.increaseStats(type: "luck", amount: self.luck, entity: player)
        }
    }
    
}



