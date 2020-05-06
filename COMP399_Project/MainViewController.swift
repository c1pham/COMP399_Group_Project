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
 
ViewDidLoad: It is are overrided to call themself and load info so it will have synchronous information when new character is made
 
viewWillAppear: It is are overrided to call themself and load info so it will have synchronous information when new character is made
*/

import UIKit

class MainViewController: UIViewController {
    
    var DataView : GameTabBarViewController? = nil
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var goldLabel: UILabel!
    
    @IBOutlet weak var levelLabel: UILabel!
    
    override func viewDidLoad() {
        DataView = parent as! GameTabBarViewController
        loadInfo()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadInfo()
        super.viewWillAppear(true)
    }
    
    func loadInfo() {
        let player = DataView?.player
        nameLabel.text = "Name: \(player!.name)"
        goldLabel.text = "Gold: \(player!.gold)"
        levelLabel.text = "Level: \(player!.level)"
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
