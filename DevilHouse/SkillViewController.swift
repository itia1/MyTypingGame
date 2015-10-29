//
//  SkillViewController.swift
//  DevilHouse
//
//  Created by Naito Seishiro on 2015/10/09.
//  Copyright © 2015年 Itia. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController {
    
    var levelfunc:Level?
    @IBOutlet weak var skillButton0: UIButton!
    @IBOutlet weak var skillButton1: UIButton!
    @IBOutlet weak var skillButton2: UIButton!
    @IBOutlet weak var skillButton3: UIButton!
    @IBOutlet weak var skillButton4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
         levelfunc = Level()
        let equipmentSkill:Int = defaults.integerForKey("equipmentSkill")
        let level:Int = defaults.integerForKey("level")
        if(level == 0){
            levelfunc!.levelup()
            var upExp:Int = defaults.integerForKey("upExp")
            upExp = 100;
            defaults.setInteger(upExp, forKey: "upExp")
        }
    /*一時的に解除
        if(level < 10){
            self.skillcButton1.enabled = false
            skillButton1.setTitle("未取得", forState: .Normal)
        }
        if(level < 20){
            self.skillButton2.enabled = false
            skillButton2.setTitle("未取得", forState: .Normal)
        }
        if(level < 30){
            self.skillButton3.enabled = false
            skillButton3.setTitle("未取得", forState: .Normal)
        }
        if(level < 40){
            self.skillButton0.enabled = false
            skillButton4.setTitle("未取得", forState: .Normal)
        }
      */
        switch equipmentSkill{
        case 0:
            self.skillButton0.enabled = false
            skillButton0.setTitle("装備中", forState: .Normal)
        case 1:
            self.skillButton1.enabled = false
            skillButton1.setTitle("装備中", forState: .Normal)
        case 2:
            self.skillButton2.enabled = false
            skillButton2.setTitle("装備中", forState: .Normal)
        case 3:
            self.skillButton3.enabled = false
            skillButton3.setTitle("装備中", forState: .Normal)
        case 4:
            self.skillButton0.enabled = false
            skillButton4.setTitle("装備中", forState: .Normal)
        default:
            break
        }
        defaults.setInteger(equipmentSkill, forKey: "equipmentSkill")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func equipmentSkillButton(sender: UIButton) {
        let num:Int = sender.tag
        let defaults = NSUserDefaults.standardUserDefaults()
        var equipmentSkill = defaults.integerForKey("equipmentSkill")
        switch equipmentSkill{
        case 0:
            self.skillButton0.enabled = true
            skillButton0.setTitle("skill1", forState: .Normal)
        case 1:
            self.skillButton1.enabled = true
            skillButton1.setTitle("skill2", forState: .Normal)
        case 2:
            self.skillButton2.enabled = true
            skillButton2.setTitle("skill3", forState: .Normal)
        case 3:
            self.skillButton3.enabled = true
            skillButton3.setTitle("skill4", forState: .Normal)
        case 4:
            self.skillButton4.enabled = true
            skillButton4.setTitle("skill5", forState: .Normal)
        default:
            break
        }
        equipmentSkill = num
        switch equipmentSkill{
        case 0:
            self.skillButton0.enabled = false
            skillButton0.setTitle("装備中", forState: .Normal)
        case 1:
            self.skillButton1.enabled = false
            skillButton1.setTitle("装備中", forState: .Normal)
        case 2:
            self.skillButton2.enabled = false
            skillButton2.setTitle("装備中", forState: .Normal)
        case 3:
            self.skillButton3.enabled = false
            skillButton3.setTitle("装備中", forState: .Normal)
        case 4:
            self.skillButton4.enabled = false
            skillButton4.setTitle("装備中", forState: .Normal)
        default:
            break
        }
        defaults.setInteger(equipmentSkill, forKey: "equipmentSkill")
        
        

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitButtom(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
       
    }
}
