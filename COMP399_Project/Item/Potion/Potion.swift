//
//  Potion.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/29/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import Foundation


class Potion : Item {
    
    override init(name: String, price: Int, description: String) {
        super.init(name: name, price: price, description: description)
    }
    
    override func use(player: Any) {
        print("Potion is used")
    }
}

