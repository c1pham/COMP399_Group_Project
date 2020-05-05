//
//  BattleViewController.swift
//  COMP399_Project
//
//  Created by Brendan Mendes on 5/3/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {
    
    //Variables
    var player = Player(name: "None", stats: [0,0,0,0], sprite: [])     //Player
    var enemy = Character(name: "None", stats: [0,0,0,0], sprite: [])   //Enemy
    var enemyIsDead = false                         //Death of enemy
    var playerIsDead = false                        //Dead of player
    var animation: [UIImage] = []
    
    //Labels
    @IBOutlet weak var playerHealth: UILabel!
    @IBOutlet weak var enemyHealth: UILabel!
    @IBOutlet weak var enemyName: UILabel!
    
    //Images
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var enemyImage: UIImageView!
    
    //Text View
    @IBOutlet weak var battleText: UITextView!
    
    //Battle Button
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
                    battlePrevText = battleText.text
                    battleText.text = "Congradulations, you leveled up! \n" + battlePrevText!
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
                
                //Player is dead
                if player.getCurrentHealth() <= 0 {
                    playerIsDead = true
                }
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
            
            //Report that Player dies
            battleText.text = "Game Over! \n" + "You have Died! \n"
            
            //If player has no sword equipped
            if !player.swordEquipped{
                
                //Change animation frames
                animation = Array(repeating: UIImage(named: "player_death_1")!, count:31)
                for i in 0..<31{
                    animation.insert(UIImage(named: "player_death_\(i+1)")!, at: i)
                }
                
            //Otherwise player has a sword equipped
            } else {
                
                //Change animation frames
                animation = Array(repeating: UIImage(named: "player_death_1")!, count:33)
                for i in 0..<31{
                    animation.insert(UIImage(named: "player_death_sword_\(i+1)")!, at: i)
                }
            }
            
            //Set new animation, with new duration and repeat only once
            playerImage.animationImages = animation
            playerImage.animationDuration = 2
            playerImage.animationRepeatCount = 1
            
            //Start the animating
            playerImage.startAnimating()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Get Player
        player = (parent as! GameTabBarViewController).player
        
        //Set health
        playerHealth.text = "\(player.getCurrentHealth())"
        
        //Player is alive
        if player.getCurrentHealth() > 0 {
            playerIsDead = false
        }
        
        //Create the animation
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the player
        player = (parent as! GameTabBarViewController).player
        
        //Spawn an enemy
        enemy = spawnEnemy(level: player.level)
        
        //Create the animation
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
