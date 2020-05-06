//
//  Item.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 5/2/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

/*
 Author: Christopher Pham
 Date: 5-6-20
 Class: Mobile Application Development
 
 Purpose:
 This is superclass class for all items. All items need the property to be used and to show its attributes.
 
 Subroutine Purpose:
 
 use: This function will be used to interact with the player. It will be override by subclass
 
 display: It will show the attributes of the item.
 
 */


import Foundation

class GameItem {
    var name: String
    var price: Int
    var description: String
    static var itemID: Int = 0 // used so we can make sure each ID will be unique
    var ID : Int //  will be used to identify each unique item

    
    
    init( name: String, price: Int, description: String) {
        self.ID = GameItem.itemID // assign ID
        GameItem.itemID = self.ID + 1 // increment so next item will have different ID
        self.name = name
        self.price = price
        self.description = description
    }
    
    func use(player: Character) {
       print("\(name) is used")
    }
    
    func display() -> String {
        return "Name: \(name), Price: \(price), Description: \(description)"
    }
    
    // will call an loop and increase players stats depending on the amount and type
    func increaseStats(type: String, amount: Int, entity: Player) {
        for _ in 0 ... amount {
            if (type == "health") {
                entity.increaseHealth()
            } else if (type == "attack") {
                entity.increaseAttack()
            } else if (type == "defense") {
                entity.increaseDefense()
            } else if (type == "lucky") {
                entity.increaseLuck()
            }
        }
    }
    
    // will call an loop and decrease players stats depending on the amount and type
    func decreaseStats(type: String, amount: Int, entity: Player) {
        for _ in 0 ... amount {
            if (type == "health") {
                entity.decreaseHealth()
            } else if (type == "attack") {
                entity.decreaseAttack()
            } else if (type == "defense") {
                entity.decreaseDefense()
            } else if (type == "lucky") {
                entity.decreaseLuck()
            }
        }
    }
}
