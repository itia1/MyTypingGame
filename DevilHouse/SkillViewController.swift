//
//  SkillViewController.swift
//  DevilHouse
//
//  Created by Naito Seishiro on 2015/10/09.
//  Copyright © 2015年 Itia. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController {
    
    @IBOutlet weak var skillButton0: UIButton!
    @IBOutlet weak var skillButton1: UIButton!
    @IBOutlet weak var skillButton2: UIButton!
    @IBOutlet weak var skillButton3: UIButton!
    @IBOutlet weak var skillButton4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        var equipmentSkill:Int = defaults.integerForKey("equipmentSkill")
        let level:Int = defaults.integerForKey("level")
        if(level < 10){
            self.skillButton1.enabled = false
            skillButton1.setTitle("レベルが足りません", forState: .Normal)
        }
        if(level < 20){
            self.skillButton2.enabled = false
            skillButton2.setTitle("レベルが足りません", forState: .Normal)
        }
        if(level < 30){
            self.skillButton3.enabled = false
            skillButton3.setTitle("レベルが足りません", forState: .Normal)
        }
        if(level < 40){
            self.skillButton0.enabled = false
            skillButton4.setTitle("レベルが足りません", forState: .Normal)
        }
        
        switch equipmentSkill{
        case 0:
            self.skillButton0.enabled = false
            skillButton0.setTitle("装備中", forState: .Normal)
        case 1:
            self.skillButton1.enabled = false
            skillButton1.setTitle("装備中", forState: .Normal)
        case 2:
            self.skillButton2.enabled = false
            skillButton2.setTitle("レベルが足りません", forState: .Normal)
        case 3:
            self.skillButton3.enabled = false
            skillButton3.setTitle("レベルが足りません", forState: .Normal)
        case 4:
            self.skillButton0.enabled = false
            skillButton4.setTitle("レベルが足りません", forState: .Normal)
        default:
            break
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func equipmentSkillButton(sender: UIButton) {
        let num:Int = sender.tag
        let defaults = NSUserDefaults.standardUserDefaults()
        var equipmentSkill = defaults.integerForKey("equipmentSkill")
       /* switch equipmentSkill{
            
        }
*/
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitButtom(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
       
    }
}
