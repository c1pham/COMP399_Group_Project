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
    
    
    init( name: String, price: Int, description: String) {
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
