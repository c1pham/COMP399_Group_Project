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
    var statChanges : [String: Int]
    
    override init(name: String, price: Int, description: String, rarity: String, statChanges : [String: Int]) {
        self.grade = rarity
        self.statChanges = statChanges
        super.init(name: name, price: price, description: description)
    }
    
    override func use(player: Any) {
        // can make generic method that goes through all stat changes and applies them
        print("Equipment is equipped")
    }
    
    override func display() {
        return super.display() + ", Grade: \(self.grade)"
    }
}

class Helmet : Equipment {
    override init(name: String, price: Int, description: String, rarity: String, statChanges : [String: Int]) {
        super.init(name: name, price: price, description: description, rarity: rarity, statChanges: statChanges)
    }
}

class ChestPiece : Equipment {
    override init(name: String, price: Int, description: String, rarity: String, statChanges : [String: Int]) {
        super.init(name: name, price: price, description: description, rarity: rarity, statChanges: statChanges)
    }
}

class Boot : Equipment {
    override init(name: String, price: Int, description: String, rarity: String, statChanges : [String: Int]) {
        super.init(name: name, price: price, description: description, rarity: rarity, statChanges: statChanges)
    }
}

class Gloves : Equipment {
    override init(name: String, price: Int, description: String, rarity: String, statChanges : [String: Int]) {
        super.init(name: name, price: price, description: description, rarity: rarity, statChanges: statChanges)
    }
}



