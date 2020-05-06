//
//  GameTabBarViewController.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/20/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

/*
Author: Christopher Pham
Date: 5-6-20
Class: Mobile Application Development

Purpose:
This main view controller will house all the player and item data that will be accessed by all the other view controllers.

Subroutine Purpose:

prepareBagData: Will make the inventory be intitated with some default game items
 
viewDidLoad: It is overriden to call itself and prepareBagData
*/

import UIKit

class GameTabBarViewController: UITabBarController {
    var player = Player(name: "John", stats: [5,5,5,5], sprite: []) // player to be accessed by other view controllers
    var bag = Inventory() // inventory to be accessed by other view controllers
    let factory = ItemFactory() // will make items
    

    override func viewDidLoad() {
        prepareBagData()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func prepareBagData() {
        bag = Inventory()
        // add items to inventory
        bag.add(item: factory.produceItem(name: "Large Hp Potion", type: "heal_potion")!)
        bag.add(item: factory.produceItem(name: "Large Hp Potion", type: "heal_potion")!)
        bag.add(item: factory.produceItem(name: "Large Hp Potion", type: "heal_potion")!)
        bag.add(item: factory.produceItem(name: "Large Hp Potion", type: "heal_potion")!)
        bag.add(item: factory.produceItem(name: "Ripped mittins", type: "gloves")!)
        bag.add(item: factory.produceItem(name: "Stick", type: "sword")!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
