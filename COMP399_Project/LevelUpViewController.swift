//
//  LevelUpViewController.swift
//  COMP399_Project
//
//  Created by Mark Miller on 5/4/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import UIKit

class LevelUpViewController: UIViewController {
    
    @IBOutlet weak var increaseButton: UIButton!
    
    
    
    @IBAction func increaseHP(_ sender: UIButton){
       // _ = (self.parent)! as! GameTabBarViewController
        let parent = GameTabBarViewController()
        parent.player.increaseHealth()
        
    }
    
    @IBAction func increaseAttack(_ sender: UIButton){
        
    }
    
    @IBAction func increaseDefense(_ sender: UIButton){
        
    }
    
    @IBAction func increaseLuck(_ sender: UIButton){
        
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
