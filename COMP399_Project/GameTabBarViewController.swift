//
//  GameTabBarViewController.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/20/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import UIKit

class GameTabBarViewController: UITabBarController {
    var player = Player(name: "John", stats: [5,5,5,5], sprite: [])
    var bag = Inventory()
    let factory = ItemFactory()
    
    

    override func viewDidLoad() {
        bag.add(item: factory.produceItem(name: "Large Hp Potion", type: "heal_potion")!)
        bag.add(item: factory.produceItem(name: "Large Hp Potion", type: "heal_potion")!)
        bag.add(item: factory.produceItem(name: "Large Hp Potion", type: "heal_potion")!)
        bag.add(item: factory.produceItem(name: "Large Hp Potion", type: "heal_potion")!)
        bag.add(item: factory.produceItem(name: "Ripped mittins", type: "gloves")!)
        bag.add(item: factory.produceItem(name: "Stick", type: "sword")!)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
