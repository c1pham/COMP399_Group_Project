//
//  Inventory.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/30/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import Foundation

class Inventory {
    var items : [GameItem]
    var count : Int
    
    init() {
        items = []
        self.count = 0
    }
    
    init(items: [GameItem]) {
        self.items = items
        self.count = items.count
    }
    
    func find(ID: Int) -> Int {
        for num in 0 ... self.count {
            if (items[num].ID == ID) {
                return num
            }
        }
        return -1
    }
    
    
    func removeAt(index: Int) -> GameItem? {
        if (index < items.count) {
            self.count = self.count - 1
            return items.remove(at: index)
        }
        return nil
    }
    
    func remove(ID : Int) -> GameItem? {
        let num = find(ID: ID)
        if (num != -1) {
            self.count = self.count - 1
            let found = self.items[num]
            self.items.remove(at: num)
            return found
        }
        return nil
    }
    
    func remove(item: GameItem) -> GameItem? {
        for bagItem in self.items {
            if (bagItem.ID == item.ID) {
                self.count = self.count - 1
                let item = self.remove(ID: bagItem.ID)
                return item
            }
        }
        return nil
    }
    
    func add(item: GameItem) {
        items.append(item)
        self.count = self.count + 1
    }
}
