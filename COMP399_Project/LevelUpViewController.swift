//
//  LevelUpViewController.swift
//  COMP399_Project
//
//  Created by Mark Miller on 5/4/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

/*
Author: Mark Miller, Christopher Pham, Brendan Mendes
Date: 5-6-20
Class: Mobile Application Development

Purpose:
This view controller will adjust the stats of the character according to the available upgrade stat points.

Subroutine Purpose:

StepperAll: When a stepper is pressed this is called. It will update or decrease the player stats based on user selection and available stat points.
 
SaveChanges: This will save the points and make it pernamenet. The user cannot retrieve points already saved.
 
ViewWillAppear: Get the player to save and show its stats. Then it will set the maximum and minium value for the steppers.
*/

import UIKit

class LevelUpViewController: UIViewController {
    var player = Player(name: "LevelUp", stats: [100,100,100,100], sprite: []) // default player
    // stats
    var health = 0
    var attack = 0
    var defense = 0
    var luck = 0
    var statPoint = 0 // stat points to use
    
    //Labels
    @IBOutlet weak var healthPnt: UILabel!
    @IBOutlet weak var attackPnt: UILabel!
    @IBOutlet weak var defensePnt: UILabel!
    @IBOutlet weak var luckPnt: UILabel!
    @IBOutlet weak var statPnt: UILabel!
    @IBOutlet weak var name: UILabel!
    
    //Steppers
    @IBOutlet weak var stepper1: UIStepper! // stepper for health
    @IBOutlet weak var stepper2: UIStepper! // stepper for attack
    @IBOutlet weak var stepper3: UIStepper! // stepper for defense
    @IBOutlet weak var stepper4: UIStepper! // stepper for luck
    
    //When Stepper is selected
    @IBAction func stepperAll(_ sender: UIStepper) {
        let tag = sender.tag
        
        //Health Stepper
        if tag == 1{
            
            //If the stepper is increased
            if health < Int(sender.value) && statPoint != 0{
                
                statPoint -= 1      //Decrease the statPoint
                health += 1         //Increase the health
                
            //If the stepper is decreased
            } else if health > Int(sender.value) && health > player.getStatHealth(){
                
                statPoint += 1      //Increase the statPoint
                health -= 1         //Decrease the health
            }
        
        //Attack Stepper
        } else if tag == 2{
            
            //If the stepper is increased
            if attack < Int(sender.value) && statPoint != 0{
                
                statPoint -= 1      //Decrease the statPoint
                attack += 1         //Increase the attack
                
            //If the stepper is decreased
            } else if attack > Int(sender.value) && attack > player.getStatAttack(){
                
                statPoint += 1      //Increase the statPoint
                attack -= 1         //Decrease the attack
            }
          
        //Defense Stepper
        } else if tag == 3{
            
            //If the stepper is increased
            if defense < Int(sender.value) && statPoint != 0{
                
                statPoint -= 1      //Decrease the statPoint
                defense += 1         //Increase the defense
                
            //If the stepper is decreased
            } else if defense > Int(sender.value) && defense > player.getStatDefense(){
                
                statPoint += 1      //Increase the statPoint
                defense -= 1         //Decrease the defense
            }
         
        //Luck Stepper
        } else if tag == 4{
            
            //If the stepper is increased
            if luck < Int(sender.value) && statPoint != 0{
                
                statPoint -= 1      //Decrease the statPoint
                luck += 1         //Increase the luck
                
            //If the stepper is decreased
            } else if luck > Int(sender.value) && luck > player.getStatLuck(){
                
                statPoint += 1      //Increase the statPoint
                luck -= 1         //Decrease the luck
            }
        }
        
        //Set the new maximumValues
        stepper1.maximumValue = Double(health + statPoint)
        stepper2.maximumValue = Double(attack + statPoint)
        stepper3.maximumValue = Double(defense + statPoint)
        stepper4.maximumValue = Double(luck + statPoint)
        
        //Update the labels
        healthPnt.text = "\(health)"
        attackPnt.text = "\(attack)"
        defensePnt.text = "\(defense)"
        luckPnt.text = "\(luck)"
        statPnt.text = "\(statPoint)"
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        
        //Reflect changes in player
        player.setStatPoint(statPoint)
        player.setStat([health, attack, defense, luck])
        
        //Set the minimum values of the steppers
        stepper1.minimumValue = Double(health)
        stepper1.value = Double(health)
        stepper2.minimumValue = Double(attack)
        stepper2.value = Double(attack)
        stepper3.minimumValue = Double(defense)
        stepper3.value = Double(defense)
        stepper4.minimumValue = Double(luck)
        stepper4.value = Double(luck)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Get the player
        let DataView = (self.parent as! GameTabBarViewController)
        player = DataView.player
               
        //Save the stat points of player
        health = player.getStatHealth()
        attack = player.getStatAttack()
        defense = player.getStatDefense()
        luck = player.getStatLuck()
        statPoint = player.getStatPoint()
        
        //Show the player's current stats
        name.text = player.getName()
        healthPnt.text = "\(player.getStatHealth())"
        attackPnt.text = "\(player.getStatAttack())"
        defensePnt.text = "\(player.getStatDefense())"
        luckPnt.text = "\(player.getStatLuck())"
        statPnt.text = "\(player.getStatPoint())"
            
        //Set the minimum values of the steppers
        stepper1.minimumValue = Double(health)
        stepper1.value = Double(health)
        stepper2.minimumValue = Double(attack)
        stepper2.value = Double(attack)
        stepper3.minimumValue = Double(defense)
        stepper3.value = Double(defense)
        stepper4.minimumValue = Double(luck)
        stepper4.value = Double(luck)
        
        //Set the new maximumValues
        stepper1.maximumValue = Double(health + statPoint)
        stepper2.maximumValue = Double(attack + statPoint)
        stepper3.maximumValue = Double(defense + statPoint)
        stepper4.maximumValue = Double(luck + statPoint)
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
