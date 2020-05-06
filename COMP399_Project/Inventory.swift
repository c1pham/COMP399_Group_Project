//
//  Inventory.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/30/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

/*
Author: Christopher Pham
Date: 5-6-20
Class: Mobile Application Development

Purpose:
This class will hold all the players items and allow the user to obtain more or remove items

Subroutine Purpose:

find: This method has finds an item in the inventory by using the item's ID
 
removeAt: Given an index this will remove an item at the particular index and return the item
 
remove: This method has two instances of itself through method overloading. It looks through the inventory and removes an item if the ID matches or if it finds the item and return the item
 
add: This will add an item to the inventory.
*/

import Foundation

class Inventory {
    var items : [GameItem] // holds all items
    var count : Int // keeps track of number of items
    
    // empty bag
    init() {
        items = []
        self.count = 0
    }
    
    // intitialize with items
    init(items: [GameItem]) {
        self.items = items
        self.count = items.count
    }
    
    func find(ID: Int) -> Int {
        // looks through bag
        for num in 0 ... self.count {
            if (items[num].ID == ID) { // if ID matches return index
                return num
            }
        }
        return -1 // return -1 if not found
    }
    
    
    func removeAt(index: Int) -> GameItem? {
        if (index < items.count) { // checks if index is within count
            self.count = self.count - 1 // reduce count
            return items.remove(at: index) // remove item at this index and return it
        }
        return nil // returns nothing if index is too big
    }
    
    func remove(ID : Int) -> GameItem? {
        let num = find(ID: ID) // find if item is in bag
        if (num != -1) { // if does exist
            self.count = self.count - 1 // reduce count
            let found = self.items[num] // get item
            self.items.remove(at: num) // remove item
            return found // return item
        }
        return nil // return nil if not in bag
    }
    
    func remove(item: GameItem) -> GameItem? {
        for bagItem in self.items { // goes through eah item
            if (bagItem.ID == item.ID) { // check if the ID's are equal
                self.count = self.count - 1
                let item = self.remove(ID: bagItem.ID)
                return item // return item
            }
        }
        return nil
    }
    
    func add(item: GameItem) {
        items.append(item)
        self.count = self.count + 1 // increase count because added item.
    }
}
