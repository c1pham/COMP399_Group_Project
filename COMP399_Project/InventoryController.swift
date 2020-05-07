//
//  InventoryController.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 5/2/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

/*
Author: Christopher Pham
Date: 5-6-20
Class: Mobile Application Development

Purpose:
All items will from the inventory will be loaded onto this table view. Each cell will hold an item and give alerts whren selected to get the description, remove the item, or use it.

Subroutine Purpose:

 loadItemData: This function will load all items and organize them into seperate arrays in the itemData array for use of table cells being generated
 
 viewDidLoad: This function will call loadItemData and intialize some instance variables
 
 viewDidAppear: This function is overrided and will call loadItemData and reload the table and call its superclass version
 
 viewWillAppear: This function is overrided and will call loadItemData and reload the table and call its superclass version
 
 numberOfSections: This will return the number of items in itemSections array
 
 tableView(_ tableView: UITableView, numberOfRowsInSection section: Int): This will return the number of rows in each section base on the items on the arrays in item data
 
 tableView(_ tableView: UITableView, titleForHeaderInSection section: Int): This will return the title for each section
 
 tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath): This will return false we want no cells to be editable
 
 tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath): This will make the cells for the tableview base on each item's data
 
 tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath): When a cell is selected it will make an alert where the user can choose to use the item, get its description, remove it, or do nothing
 
*/

import UIKit

class InventoryController: UITableViewController {
    var DataView :  GameTabBarViewController? = nil // reference to parent view controller
    var itemData : [AnyObject] = [] // will hold all data for each section's items
    var itemSections : [String?] = [] // will hold the name of each item section
    
    func loadItemData() {
        let bag = DataView?.bag // reference to player inventory
        
        // hold all items according to type
        var healPotionData : [GameItem?] = []
        var swordData : [GameItem?] = []
        var helmetData : [GameItem?] = []
        var gloveData : [GameItem?] = []
        var chestPieceData : [GameItem?] = []
        var bootData : [GameItem?] = []
        
        
        for num in 0 ... bag!.items.count - 1  { // go through each item and add them into the appropriate array base on their type
            let item : GameItem = bag!.items[num] // get item from bag
            if (type(of: item) == HealPotion.self ) {
                healPotionData.append(item)
            } else if (type(of: item) == Sword.self ) {
                swordData.append(item)
            } else if (type(of: item) == Helmet.self ) {
                helmetData.append(item)
            } else if (type(of: item) == Gloves.self ) {
                gloveData.append(item)
            } else if (type(of: item) == ChestPiece.self ) {
                chestPieceData.append(item)
            } else if (type(of: item) == Boot.self ) {
                bootData.append(item)
            }
        }
        // put all arrays in itemData in order that lines up with each section
        itemData = [healPotionData as AnyObject, swordData as AnyObject, helmetData as AnyObject, gloveData as AnyObject, chestPieceData as AnyObject, bootData as AnyObject]
    }
    
    
    override func viewDidLoad() {
        DataView = (parent as! GameTabBarViewController)
        itemSections = ["HealPotion", "Sword", "Helmet", "Gloves", "ChestPiece", "Boot"] // set up sections
        loadItemData()
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadItemData()
        self.tableView.reloadData()
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadItemData()
        self.tableView.reloadData()
        super.viewWillAppear(true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return itemSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemData[section].count // the indexes line up with each section, and the count will be the number of rows in it
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return itemSections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) //placeholder of prototype cell
        let item = ((itemData[indexPath.section] as! [AnyObject])[indexPath.row] as! GameItem)
        cell.textLabel!.text = item.name // get name of item
        cell.detailTextLabel!.text = "Description: \(item.description), Price: \(item.price)" // make description for cell
        
        //cell.imageView!.image = UIImage(named: ((flowerData[indexPath.section] as! [AnyObject])[indexPath.row] as! [String:String])["picture"]!)!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = ((itemData[indexPath.section] as! [AnyObject])[indexPath.row] as! GameItem)

         // 1st step set up alert controller 1st
        let alertController = UIAlertController(title: "Select Action", message: "There are mutiple options", preferredStyle: UIAlertController.Style.alert)
        // 2rd step create actions/ buttons
        // we can do different style, we can do closer
        // alert action is input, then in keyword after is seperator between input and function, we put in {} because it is closure, the input is the UI alert action and the extra statement we want to perform is we want to perform string content
        // when now action is trigger, closure is like a tiny function but closure does not have name where as function has name, when we call fucntion we need function name, but for closure we just need to put stuff in curly parathesis
        let useAction = UIAlertAction(title: "Use", style:
            UIAlertAction.Style.default, handler: {(alertAction: UIAlertAction) in
                print(item.display())
                let itemType = type(of: item)
                let player = (self.DataView!.player as Character)
                if (itemType == HealPotion.self) { // if item is heal potion then use, remove the item, and reload item data and table
                    item.use(player: player)
                    self.DataView?.bag.remove(ID: item.ID)
                    self.loadItemData()
                    self.tableView.reloadData()
                    // give notification to player that they succeeded in use
                    let successAlertController = UIAlertController(title: "Success", message: "\(item.name) was used", preferredStyle: UIAlertController.Style.alert)
                    let successAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                    // this is how we add button to alert controller, which is okay btn action
                    successAlertController.addAction(successAction)
                    self.present(successAlertController, animated: true, completion: nil)
                } else if (itemType == Sword.self || itemType == Helmet.self || itemType == Gloves.self || itemType == Boot.self || itemType == ChestPiece.self  ) { // check if the item is an equipment
                    let before = (item as! Equipment).equipped // place holder to keep track if anything changed after function is called
                    item.use(player: player)
                    if (before == (item as! Equipment).equipped) { // if the equipped didn't change then give error
                        let warningAlertController = UIAlertController(title: "Error", message: "Player already has an item of this type equipped", preferredStyle: UIAlertController.Style.alert)
                        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                        // this is how we add button to alert controller, which is okay btn action
                        warningAlertController.addAction(defaultAction)
                        self.present(warningAlertController, animated: true, completion: nil)
                    } else { // notify user that they successfully used the item.
                        let successAlertController = UIAlertController(title: "Success", message: "\(item.name) used", preferredStyle: UIAlertController.Style.alert)
                        let successAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                        // this is how we add button to alert controller, which is okay btn action
                        successAlertController.addAction(successAction)
                        self.present(successAlertController, animated: true, completion: nil)
                    }
                }
        })
        
        // will show the user the description of the item
        let descriptionAction = UIAlertAction(title: "Get Description", style: UIAlertAction.Style.default, handler: {(alertAction : UIAlertAction) in
            let descriptionAlertController = UIAlertController(title: "Description", message: item.display(), preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            // this is how we add button to alert controller, which is okay btn action
            descriptionAlertController.addAction(defaultAction)
            self.present(descriptionAlertController, animated: true, completion: nil )}
        )
        
        // will remove item from inventory if possible
        let removeAction = UIAlertAction(title: "Remove Item", style: UIAlertAction.Style.destructive, handler: {(alertAction : UIAlertAction) in
            if (type(of: item) != HealPotion.self && (item as! Equipment).equipped){ // if the item is not a heal potion and is equipped then don't delete
                let warningAlertController = UIAlertController(title: "Error", message: "This item is equipped you cannot remove it without taking it off first", preferredStyle: UIAlertController.Style.alert)
                let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                // this is how we add button to alert controller, which is okay btn action
                warningAlertController.addAction(defaultAction)
                self.present(warningAlertController, animated: true, completion: nil)
            } else { // delete from bag and remove table
                self.DataView?.bag.remove(ID: item.ID)
                self.loadItemData()
                self.tableView.reloadData()
            }
            
        })
               
        let okAction = UIAlertAction(title: "Exit", style: UIAlertAction.Style.cancel, handler: nil)
               
        // 3rd Step: add actions/button to alert controller
        alertController.addAction(useAction)
        alertController.addAction(descriptionAction)
        alertController.addAction(removeAction)
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
        return false
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
