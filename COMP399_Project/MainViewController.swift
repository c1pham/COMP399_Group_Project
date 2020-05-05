//
//  MainViewController.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 5/5/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

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
