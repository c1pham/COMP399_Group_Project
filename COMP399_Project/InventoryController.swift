//
//  InventoryController.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 5/2/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import UIKit

class InventoryController: UITableViewController {
    var DataView :  GameTabBarViewController? = nil
    var itemData : [AnyObject] = []
    var itemSections : [String?] = []
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemCell" {
            
        }
    }
    */
    func loadItemData() {
        let bag = DataView?.bag
        
        var healPotionData : [GameItem?] = []
        var swordData : [GameItem?] = []
        var helmetData : [GameItem?] = []
        var gloveData : [GameItem?] = []
        var chestPieceData : [GameItem?] = []
        var bootData : [GameItem?] = []
        
        for num in 0 ... bag!.items.count - 1  {
            let item : GameItem = bag!.items[num]
            
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
        itemData = [healPotionData as AnyObject, swordData as AnyObject, helmetData as AnyObject, gloveData as AnyObject, chestPieceData as AnyObject, bootData as AnyObject]
    }
    
    
    override func viewDidLoad() {
        DataView = (parent as! GameTabBarViewController)
        itemSections = ["HealPotion", "Sword", "Helmet", "Gloves", "ChestPiece", "Boot"]
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
        return itemData[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return itemSections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) //placeholder of prototype cell
        let item = ((itemData[indexPath.section] as! [AnyObject])[indexPath.row] as! GameItem)
        cell.textLabel!.text = item.name
        cell.detailTextLabel!.text = "Description: \(item.description), Price: \(item.price)"
        
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
                let itemType = type(of: item)
                let player = (self.DataView!.player as Character)
                if (itemType == HealPotion.self) {
                    item.use(player: player)
                    self.DataView?.bag.remove(ID: item.ID)
                    self.loadItemData()
                    self.tableView.reloadData()
                } else if (itemType == Sword.self || itemType == Helmet.self || itemType == Gloves.self || itemType == Boot.self || itemType == ChestPiece.self  ) {
                    let before = (item as! Equipment).equipped
                    item.use(player: player)
                    if (before == (item as! Equipment).equipped) {
                        let warningAlertController = UIAlertController(title: "Error", message: "Player already has an item of this type equipped", preferredStyle: UIAlertController.Style.alert)
                        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                        // this is how we add button to alert controller, which is okay btn action
                        warningAlertController.addAction(defaultAction)
                        self.present(warningAlertController, animated: true, completion: nil)
                    } else {
                        let successAlertController = UIAlertController(title: "Success", message: "Item used", preferredStyle: UIAlertController.Style.alert)
                        let successAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                        // this is how we add button to alert controller, which is okay btn action
                        successAlertController.addAction(successAction)
                        self.present(successAlertController, animated: true, completion: nil)
                    }
                }
        }) // title is like how OK btn has title
        
        let descriptionAction = UIAlertAction(title: "Get Description", style: UIAlertAction.Style.default, handler: {(alertAction : UIAlertAction) in
            let descriptionAlertController = UIAlertController(title: "Description", message: item.display(), preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            // this is how we add button to alert controller, which is okay btn action
            descriptionAlertController.addAction(defaultAction)
            self.present(descriptionAlertController, animated: true, completion: nil )}
        )
        
        let removeAction = UIAlertAction(title: "Remove Item", style: UIAlertAction.Style.destructive, handler: {(alertAction : UIAlertAction) in
            self.DataView?.bag.remove(ID: item.ID)
            self.loadItemData()
            self.loadView()
        })
        
        //let descriptionAlertController = UIAlertController(title: "Description", message: item.display(), preferredStyle: UIAlertController.Style.alert)
               
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
