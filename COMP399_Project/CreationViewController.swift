//
//  CreationViewController.swift
//  COMP399_Project
//
//  Created by Brendan Mendes on 5/5/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

/*
Author: Brendan Mendes
Editor: Christopher Pham
Date: 5-6-20
Class: Mobile Application Development

Purpose:
This view controller will take information from the creation view and create a whole new player to be uploaded into the GameTabBarViewController.

Subroutine Purpose:

 stepperPressed: This will make the stepper increase or decrease variable stat points and increase or decrease the stat of the player according to the stepper pressed.
 
 saveButton: This will take the name and stats set by the user and set the player in GameTabBarViewController to the new player and dismiss this view. It will also check if name is filled. If not an alert is created for an error.

*/

import UIKit

class CreationViewController: UIViewController {
    
    //Variables
    var statPoints = 5
    var health = 5
    var attack = 5
    var defense = 5
    var luck = 5
    
    //TextField
    @IBOutlet weak var nameTextField: UITextField!
    
    //Labels
    @IBOutlet weak var statPnt: UILabel!
    @IBOutlet weak var healthPnt: UILabel!
    @IBOutlet weak var attackPnt: UILabel!
    @IBOutlet weak var defensePnt: UILabel!
    @IBOutlet weak var luckPnt: UILabel!
    
    //Steppers
    @IBOutlet weak var stepper1: UIStepper! // stepper for health
    @IBOutlet weak var stepper2: UIStepper! // stepper for attack
    @IBOutlet weak var stepper3: UIStepper! // stepper for defense
    @IBOutlet weak var stepper4: UIStepper! // stepper for luck
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        let tag = sender.tag
        let val = Int(sender.value)
        
        //If the Health Stepper pressed
        if tag == 1{
 
            //If the value has increased, increase health
            if val > health {
                statPoints -= 1
                health += 1
                
            //Otherwise if value has decrease, decrease health
            } else if val < health{
                statPoints += 1
                health -= 1
            }
            
            //Change texts to appropriate value
            healthPnt.text = "Current Value: \(health)"
        
        //If the Attack Stepper pressed
        } else if tag == 2{
            
            //If the value has increased, increase attack
            if val > attack {
                statPoints -= 1
                attack += 1
                
            //Otherwise if value has decrease, decrease attack
            } else if val < attack{
                statPoints += 1
                attack -= 1
            }
            
            //Change texts to appropriate value
            attackPnt.text = "Current Value: \(attack)"
            
        //If the Defense Stepper pressed
        } else if tag == 3{
            
            //If the value has increased, increase defense
            if val > defense {
                statPoints -= 1
                defense += 1
                
            //Otherwise if value has decrease, decrease defense
            } else if val < defense{
                statPoints += 1
                defense -= 1
            }
            
            //Change texts to appropriate value
            defensePnt.text = "Current Value: \(defense)"
            
        //If the Luck Stepper pressed
        } else if tag == 4{
            
            //If the value has increased, increase attack
            if val > luck {
                statPoints -= 1
                luck += 1
                
            //Otherwise if value has decrease, decrease health
            } else if val < luck{
                statPoints += 1
                luck -= 1
            }
            
            //Change texts to appropriate value
            luckPnt.text = "Current Value: \(luck)"
        }
        
        //Set the new maximumValues
        stepper1.maximumValue = Double(health + statPoints)
        stepper2.maximumValue = Double(attack + statPoints)
        stepper3.maximumValue = Double(defense + statPoints)
        stepper4.maximumValue = Double(luck + statPoints)
        
        //Update Stat Points
        statPnt.text = "Current Number of Stat Points: \(statPoints)"
    }
    
    //Save Button
    @IBAction func saveButton(_ sender: Any) {
        
        //Get the various stats and name of character
        
        
        let name = nameTextField.text!
        
        if (name == "") {
            let warningAlertController = UIAlertController(title: "Error", message: "There is no name input here.", preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            // this is how we add button to alert controller, which is okay btn action
            warningAlertController.addAction(defaultAction)
            self.present(warningAlertController, animated: true, completion: nil )
            return
        }
        let stats = [health, attack, defense, luck]
        
        //Create a character using the various stats
        (presentingViewController as! GameTabBarViewController).player = Player(name: name, stats: stats)
        
        //Save the unused stat points
        (presentingViewController as! GameTabBarViewController).player.setStatPoint(statPoints)
        (presentingViewController as! GameTabBarViewController).prepareBagData()
        ((presentingViewController as! GameTabBarViewController).viewControllers![0] as! MainViewController).loadInfo()
        
        //Dismiss view
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
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
