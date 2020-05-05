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
    var DataView : GameTabBarViewController? = nil
    
    
    
    @IBAction func increaseHP(_ sender: UIButton){
        DataView!.player.increaseHealth()
        print("print HP")
    }
    
    @IBAction func increaseAttack(_ sender: UIButton){
        DataView!.player.increaseAttack()
        print("print atk")

    }
    
    @IBAction func increaseDefense(_ sender: UIButton){
        DataView!.player.increaseDefense()
        print("print def")

    }
    
    @IBAction func increaseLuck(_ sender: UIButton){
        DataView!.player.increaseLuck()
        print("print luck")
    }

    override func viewDidLoad() {
        DataView = (self.parent as! GameTabBarViewController)
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
