//
//  BattleViewController.swift
//  COMP399_Project
//
//  Created by Brendan Mendes on 5/3/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {
    var player = Player(name: "None", stats: [0,0,0,0], sprite: "None")     //Player
    var enemy = Character(name: "None", stats: [0,0,0,0], sprite: "None")   //Enemy
    var enemyIsDead = false                         //Death of enemy
    var playerIsDead = false                        //Dead of player
    
    @IBOutlet weak var playerHealth: UILabel!
    @IBOutlet weak var enemyHealth: UILabel!
    @IBOutlet weak var enemyName: UILabel!
    
    @IBOutlet weak var battleText: UITextView!
    @IBOutlet weak var battleButton: UIButton!
    
    func damageTaken(_ attack: Int, _ defense: Int) -> Int{
        if attack < defense{
            return 1
        }
        return attack - defense
    }
    
    //When you decide to escape
    @IBAction func escapeButton(_ sender: Any) {
        
        //Variables
        var battlePrevText = battleText.text            //The previous text
        let emyAtt = damageTaken(enemy.getAttack(), player.getDefense())                //Get the attack of enemy
        
        //Player is dead when button is clicked
        if player.getCurrentHealth() <= 0 {
            playerIsDead = true
        }
        
        if !playerIsDead{
            //You escape with damage taken. Can't infinitely escape
            battleText.text = "You have escaped taking \(emyAtt) damage! \n" + battlePrevText!
        
            //Player takes damage
            player.changeHealth(emyAtt)
        
            //Reflect current damage
            playerHealth.text = "\(player.getCurrentHealth())"
        
            //Create a new enemy
            enemy = spawnEnemy(level: player.level)
        
            //Change button to Start
            battleButton.setTitle("Start Battle", for: UIControl.State.normal)
        
            //Change label to match changes
            enemyName.text = enemy.getName()
            enemyHealth.text = "\(enemy.getCurrentHealth())"
        
            //Announce the changes
            battlePrevText = battleText.text
            battleText.text = "You have encountered a new enemy. (\(enemy.getName())) \n" + battlePrevText!
        }
    }
    
    //When Battle occurs
    @IBAction func battleButtonPressed(_ sender: Any) {
        
        //Variables
        var battlePrevText = battleText.text            //The previous text
        let plyAtt = damageTaken(player.getAttack(), enemy.getDefense())                //Get the attack of player
        let emyAtt = damageTaken(enemy.getAttack(), player.getDefense())                 //Get the attack of enemy
        
        //Player is dead when button is clicked
        if player.getCurrentHealth() <= 0 {
            playerIsDead = true
        }
        
        //Change button to continue battling
        if battleButton.title(for: UIControl.State.normal) == "Start Battle"{
            battleButton.setTitle("Continue Battle", for: UIControl.State.normal)
        }
        
        if !playerIsDead{
            //Change health of enemy according to player attack
            enemy.changeHealth(plyAtt)
        
            //Announce the change to user
            battleText.text = "\(enemy.getName()) has taken \(plyAtt) damage. \n" + battlePrevText!
        
            //Show the enemy health
            enemyHealth.text = "\(enemy.getCurrentHealth())"
            
            //If the enemy is dead
            if enemy.getCurrentHealth() <= 0{
            
                //Save previous text
                battlePrevText = battleText.text
            
                //Annouce death
                battleText.text = "You defeated \(enemy.getName())! \n" + battlePrevText!
            
                //Change variable
                enemyIsDead = true
                
                //Let the player gain Exp
                player.increaseExp(10 + enemy.level)
                
                //Player gets money
                player.changeGold(10 + Int(arc4random_uniform(UInt32(enemy.level))))
                
                //If the player has enough Exp levelup
                if player.curExp >= player.maxExp{
                    player.levelUp()
                }
                
            
                //Otherwise the enemy attacks
            } else {
            
                //change health of player
                player.changeHealth(emyAtt)
            
                //Save previous text
                battlePrevText = battleText.text
            
                //Anounce changes
                battleText.text = "\(player.getName()) has taken \(emyAtt) damage. \n" + battlePrevText!
                playerHealth.text = "\(player.getCurrentHealth())"
            }
        }
        
        //If the enemy is dead
        if enemyIsDead{
            
            //Create a new enemy
            enemy = spawnEnemy(level: player.level)
            
            //Change button to Start
            battleButton.setTitle("Start Battle", for: UIControl.State.normal)
            
            //Enemy is no longer dead
            enemyIsDead = false
            
            //Change label to match changes
            enemyName.text = enemy.getName()
            enemyHealth.text = "\(enemy.getCurrentHealth())"
            
            //Announce the changes
            battlePrevText = battleText.text
            battleText.text = "You have encountered a new enemy. (\(enemy.getName())) \n" + battlePrevText!
        }
        
        //If player dies
        if playerIsDead{
            battleText.text = "Game Over! \n" + "You have Died! \n"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        player = (parent as! GameTabBarViewController).player
        enemy = spawnEnemy(level: player.level)
        
        //Change label to match values
        enemyName.text = enemy.getName()
        playerHealth.text = "\(player.getCurrentHealth())"
        enemyHealth.text = "\(enemy.getCurrentHealth())"
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
