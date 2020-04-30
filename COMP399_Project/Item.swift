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
    
    func use(player: Any) {
       print("\(name) is used")
    }
    
    func display() -> String {
        return "Name: \(name), Price: \(price), Description: \(description)"
    }
}
