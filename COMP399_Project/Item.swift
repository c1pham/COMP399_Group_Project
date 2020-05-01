//
//  Item.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/20/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import Foundation

class Item {
    var name: String
    var price: Int
    var description: String
    static var itemID: Int = 1000
    var ID : Int
    
    
    init( name: String, price: Int, description: String) {
        self.ID = Item.itemID
        Item.itemID = self.ID + 1
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



