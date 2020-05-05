//
//  StoreTableViewController.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 5/3/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

// https://stackoverflow.com/questions/48515758/accessing-child-view-controllers-of-a-uitabbarcontroller


import UIKit

class StoreTableViewController: UITableViewController {
    var DataView :  GameTabBarViewController? = nil
    var itemData : [AnyObject] = []
    var itemSections : [String?] = []
    var factory = ItemFactory()
    
    var inventoryView : InventoryController? = nil

    override func viewDidLoad() {
        
        DataView = (parent as! GameTabBarViewController)
        itemSections = ["HealPotion", "Sword", "Helmet", "Gloves", "ChestPiece", "Boot"]
        inventoryView = DataView?.viewControllers![3] as? InventoryController
        print("inventory view \(inventoryView!)")
        var healPotionData : [GameItem?] = []
        var swordData : [GameItem?] = []
        var helmetData : [GameItem?] = []
        var gloveData : [GameItem?] = []
        var chestPieceData : [GameItem?] = []
        var bootData : [GameItem?] = []
        
        print("start heal")
        for num in 0 ... factory.healPotionStats.count - 1  {
            healPotionData.append(factory.produceItem(name: factory.healPotionStats[num][0] as! String, type: "heal_potion"))
        }
        print("finish heal")
        
        for num in 0 ... factory.swordStats.count - 1 {
            swordData.append(factory.produceItem(name: factory.swordStats[num][0] as! String, type: "sword"))
        }
        print("finish sword")
        
        for num in 0 ... factory.helmetStats.count - 1 {
            helmetData.append(factory.produceItem(name: factory.helmetStats[num][0] as! String, type: "helmet"))
        }
        print("finish helemt")
        
        for num in 0 ... factory.glovesStats.count - 1 {
            gloveData.append(factory.produceItem(name: factory.glovesStats[num][0] as! String, type: "gloves"))
        }
        print("finish gloves")
        
        for num in 0 ... factory.chestPieceStats.count - 1 {
            chestPieceData.append(factory.produceItem(name: factory.chestPieceStats[num][0] as! String, type: "chest_piece"))
        }
        print("finish chest")
        
        for num in 0 ... factory.bootStats.count - 1 {
            bootData.append(factory.produceItem(name: factory.bootStats[num][0] as! String, type: "boot"))
        }
        print("finish boot")
        
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
        return itemData[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeItem", for: indexPath) //placeholder of prototype cell
        let item = ((itemData[indexPath.section] as! [AnyObject])[indexPath.row] as! GameItem)
        cell.textLabel!.text = item.name
        cell.detailTextLabel!.text = "Description: \(item.description), Price: \(item.price)"
        
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
  
        let descriptionAction = UIAlertAction(title: "Get Description", style: UIAlertAction.Style.default, handler: {(alertAction : UIAlertAction) in
            let descriptionAlertController = UIAlertController(title: "Description", message: item.display(), preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            // this is how we add button to alert controller, which is okay btn action
            descriptionAlertController.addAction(defaultAction)
            self.present(descriptionAlertController, animated: true, completion: nil )}
        )
        
        let buyAction = UIAlertAction(title: "Buy Item", style: UIAlertAction.Style.default, handler: {(alertAction : UIAlertAction) in
            let item = self.factory.produceItem(name: item.name, type: itemType[indexPath.section])!
            if (item.price <= (self.DataView?.player.gold)!) {
                print("buy \(item)")
                self.DataView?.bag.add(item: item)
                self.inventoryView?.tableView.reloadData()
                let successAlertController = UIAlertController(title: "Success", message: "Item added the inventory", preferredStyle: UIAlertController.Style.alert)
                let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                // this is how we add button to alert controller, which is okay btn action
                successAlertController.addAction(defaultAction)
                self.present(successAlertController, animated: true, completion: nil )
            } else {
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
