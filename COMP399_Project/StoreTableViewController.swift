//
//  StoreTableViewController.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 5/3/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//


/*
Author: Christopher Pham
Date: 5-6-20
Class: Mobile Application Development

Purpose:
All items will be loaded onto this table view and when an cell is selected a user can buy it and it will added into their inventory.

Subroutine Purpose:
 
 viewDidLoad: This function will call loadItemData and intialize some instance variables
 
 viewDidAppear: This function is overrided to load all possible items and organize the into a 2D array for the use of making cells later
 
 viewWillAppear: This function is overrided and will call loadItemData and reload the table and call its superclass version
 
 numberOfSections: This will return the number of items in itemSections array
 
 tableView(_ tableView: UITableView, numberOfRowsInSection section: Int): This will return the number of rows in each section base on the items on the arrays in item data
 
 tableView(_ tableView: UITableView, titleForHeaderInSection section: Int): This will return the title for each section
 
 tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath): This will return false we want no cells to be editable
 
 tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath): This will make the cells for the tableview base on each item's data
 
 tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath): When a cell is selected it will make an alert where the user can choose to buy an item, get an description or do nothing.
 
*/

// https://stackoverflow.com/questions/48515758/accessing-child-view-controllers-of-a-uitabbarcontroller


import UIKit

class StoreTableViewController: UITableViewController {
    var DataView :  GameTabBarViewController? = nil // reference to parent view controller
    var itemData : [AnyObject] = [] // has item data for table view cells
    var itemSections : [String?] = [] // hold section names for table view
    var factory = ItemFactory() // factory to make items
    
    var inventoryView : InventoryController? = nil // reference to inventory view controller

    override func viewDidLoad() {
        
        DataView = (parent as! GameTabBarViewController)
        itemSections = ["HealPotion", "Sword", "Helmet", "Gloves", "ChestPiece", "Boot"]
        inventoryView = DataView?.viewControllers![3] as? InventoryController
        
        // arrays to hold items
        var healPotionData : [GameItem?] = []
        var swordData : [GameItem?] = []
        var helmetData : [GameItem?] = []
        var gloveData : [GameItem?] = []
        var chestPieceData : [GameItem?] = []
        var bootData : [GameItem?] = []
        
        // go through each stats array in factory and use its the first item of each array in it, which is the name of the item and make the item to put into the Data arrays
        for num in 0 ... factory.healPotionStats.count - 1  {
            healPotionData.append(factory.produceItem(name: factory.healPotionStats[num][0] as! String, type: "heal_potion"))
        }
        
        for num in 0 ... factory.swordStats.count - 1 {
            swordData.append(factory.produceItem(name: factory.swordStats[num][0] as! String, type: "sword"))
        }
        
        for num in 0 ... factory.helmetStats.count - 1 {
            helmetData.append(factory.produceItem(name: factory.helmetStats[num][0] as! String, type: "helmet"))
        }
        
        for num in 0 ... factory.glovesStats.count - 1 {
            gloveData.append(factory.produceItem(name: factory.glovesStats[num][0] as! String, type: "gloves"))
        }
        
        for num in 0 ... factory.chestPieceStats.count - 1 {
            chestPieceData.append(factory.produceItem(name: factory.chestPieceStats[num][0] as! String, type: "chest_piece"))
        }
        
        for num in 0 ... factory.bootStats.count - 1 {
            bootData.append(factory.produceItem(name: factory.bootStats[num][0] as! String, type: "boot"))
        }
        
        // put item data into this array in the same order of the names in itemSections
        itemData = [healPotionData as AnyObject, swordData as AnyObject, helmetData as AnyObject, gloveData as AnyObject, chestPieceData as AnyObject, bootData as AnyObject]
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return itemSections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return itemSections[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemData[section].count // each array's count in itemData will be the number of neccesary rows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeItem", for: indexPath) //placeholder of prototype cell
        let item = ((itemData[indexPath.section] as! [AnyObject])[indexPath.row] as! GameItem)
        cell.textLabel!.text = item.name // get name of item
        cell.detailTextLabel!.text = "Description: \(item.description), Price: \(item.price)" // set up item description
        
        //cell.imageView!.image = UIImage(named: ((flowerData[indexPath.section] as! [AnyObject])[indexPath.row] as! [String:String])["picture"]!)!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemType = ["heal_potion", "sword", "helmet", "gloves", "chest_piece", "boot"]
        let item = ((itemData[indexPath.section] as! [AnyObject])[indexPath.row] as! GameItem)

         // 1st step set up alert controller 1st
        let alertController = UIAlertController(title: "Select Action", message: "There are mutiple options", preferredStyle: UIAlertController.Style.alert)
        // 2rd step create actions/ buttons
        // we can do different style, we can do closer
        // alert action is input, then in keyword after is seperator between input and function, we put in {} because it is closure, the input is the UI alert action and the extra statement we want to perform is we want to perform string content
        // when now action is trigger, closure is like a tiny function but closure does not have name where as function has name, when we call fucntion we need function name, but for closure we just need to put stuff in curly parathesis
  
        // show item description
        let descriptionAction = UIAlertAction(title: "Get Description", style: UIAlertAction.Style.default, handler: {(alertAction : UIAlertAction) in
            let descriptionAlertController = UIAlertController(title: "Description", message: item.display(), preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            // this is how we add button to alert controller, which is okay btn action
            descriptionAlertController.addAction(defaultAction)
            self.present(descriptionAlertController, animated: true, completion: nil )}
        )
        
        // buy item
        let buyAction = UIAlertAction(title: "Buy Item", style: UIAlertAction.Style.default, handler: {(alertAction : UIAlertAction) in
            let item = self.factory.produceItem(name: item.name, type: itemType[indexPath.section])!
            if (item.price <= (self.DataView?.player.gold)!) { // if player has enough gold buy
                self.DataView?.bag.add(item: item) // add item to inventory
                self.DataView?.player.gold -= item.price
                self.inventoryView?.tableView.reloadData() // reload inventory table
                // success message
                let successAlertController = UIAlertController(title: "Success", message: "Item added the inventory", preferredStyle: UIAlertController.Style.alert)
                let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                // this is how we add button to alert controller, which is okay btn action
                successAlertController.addAction(defaultAction)
                self.present(successAlertController, animated: true, completion: nil )
            } else {
                // warning message
                let warningAlertController = UIAlertController(title: "Error", message: "You don't have enough money", preferredStyle: UIAlertController.Style.alert)
                let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                // this is how we add button to alert controller, which is okay btn action
                warningAlertController.addAction(defaultAction)
                self.present(warningAlertController, animated: true, completion: nil )}
            }
        )
        
        //let descriptionAlertController = UIAlertController(title: "Description", message: item.display(), preferredStyle: UIAlertController.Style.alert)
               
        let okAction = UIAlertAction(title: "Exit", style: UIAlertAction.Style.cancel, handler: nil)
               
        // 3rd Step: add actions/button to alert controller
        alertController.addAction(descriptionAction)
        alertController.addAction(buyAction)
        alertController.addAction(okAction)
               
        // last step present controller
        present(alertController, animated: true, completion: nil)
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
