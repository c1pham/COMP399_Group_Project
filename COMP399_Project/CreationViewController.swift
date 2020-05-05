//
//  CreationViewController.swift
//  COMP399_Project
//
//  Created by Brendan Mendes on 5/5/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

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
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        let tag = sender.tag
        let val = Int(sender.value)
        
        //If the Health Stepper pressed
        if tag == 1{
            
            //Change max Value to appropriate amount
            sender.maximumValue = Double(statPoints + health)
            
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
            statPnt.text = "Current Number of Stat Points: \(statPoints)"
        
        //If the Attack Stepper pressed
        } else if tag == 2{
            
            //Change max Value to appropriate amount
            sender.maximumValue = Double(statPoints + attack)
            
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
            statPnt.text = "Current Number of Stat Points: \(statPoints)"
            
        //If the Defense Stepper pressed
        } else if tag == 3{
            
            //Change max Value to appropriate amount
            sender.maximumValue = Double(statPoints + defense)
            
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
            attackPnt.text = "Current Value: \(defense)"
            statPnt.text = "Current Number of Stat Points: \(statPoints)"
            
        //If the Luck Stepper pressed
        } else if tag == 2{
            
            //Change max Value to appropriate amount
            sender.maximumValue = Double(statPoints + luck)
            
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
            attackPnt.text = "Current Value: \(luck)"
            statPnt.text = "Current Number of Stat Points: \(statPoints)"
        }
    }
    
    //Save Button
    @IBAction func saveButton(_ sender: Any) {
        let stats = [health, attack, defense, luck]
        let name = nameTextField.text!
        
        print("before")
        print("after")
        (presentingViewController as! GameTabBarViewController).player = Player(name: name, stats: stats, sprite: [])
        
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
