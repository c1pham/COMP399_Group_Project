//
//  MainViewController.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 5/5/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

/*
Author: Christopher Pham
Date: 5-6-20
Class: Mobile Application Development

Purpose:
This view controller will load the player information into some labels when loaded

Subroutine Purpose:

loadInfo: This will take the name level and gold attribute from the player and upload them into labels
 
ViewDidLoad: It is are overrided to call themself and load info so it will have synchronous information when new character is made. It will also call prepare animation.
 
viewWillAppear: It is are overrided to call themself and load info so it will have synchronous information when new character is made. It will also call prepare animation.
 
prepareAnimation: Sets up image view to animiate character
 
changeNameClicked: Will open a alert to receive user input to change players name
*/

import UIKit

class MainViewController: UIViewController {
    
    var DataView : GameTabBarViewController? = nil
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var goldLabel: UILabel!
    
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var levelLabel: UILabel!
    
    var animation: [UIImage] = [] // animation frames
    
    
    @IBAction func changeNameClicked(_ sender: Any) {
        // 1st step set up alert controller container
        let alertController = UIAlertController(title: "Name", message: "Please enter new name for player", preferredStyle: UIAlertController.Style.alert)
        //2rd step set up action
        // this creates placeholder for textfield.
        alertController.addTextField(configurationHandler:
            {(textField: UITextField) in
                textField.placeholder = "Name"
                textField.keyboardType = UIKeyboardType.emailAddress
        })
        
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(alertAction: UIAlertAction) in
            // alert controller is the container, we add a textfield to it earlier, we can use . symbol to reference componenet
            // alert controller automatically has textfields as property
            let name : String = alertController.textFields![0].text!
            self.DataView?.player.name = name
            self.loadInfo()
        })
        //3rd step insert action into container
        alertController.addAction(defaultAction)
        //4th step present it
        present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        DataView = (parent as! GameTabBarViewController)
        loadInfo()
        prepareAnimation()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadInfo()
        prepareAnimation()
        super.viewWillAppear(true)
    }
    
    func loadInfo() {
        let player = DataView?.player
        nameLabel.text = "Name: \(player!.name)"
        goldLabel.text = "Gold: \(player!.gold)"
        levelLabel.text = "Level: \(player!.level)"
    }
    
    func prepareAnimation() {
        let player = DataView!.player
        if !player.swordEquipped{
            for i in 0..<12{
                animation.append(UIImage(named:"player_idle_\(i+1)")!)
            }
        } else {
            for i in 0..<12{
                animation.append(UIImage(named:"player_idle_sword_\(i+1)")!)
            }
        }
        
        //Set the animation with duration
        playerImage.animationImages = animation
        playerImage.animationDuration = 4
        
        //Start animating
        playerImage.startAnimating()
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
