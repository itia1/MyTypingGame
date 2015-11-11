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
            self.skillButton4.enabled = false
            skillButton4.setTitle("装備中", forState: .Normal)
        default:
            break
        }
        defaults.setInteger(equipmentSkill, forKey: "equipmentSkill")
        defaults.synchronize()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func equipmentSkillButton(sender: UIButton) {
        let num:Int = sender.tag
        let defaults = NSUserDefaults.standardUserDefaults()
        var equipmentSkill = defaults.integerForKey("equipmentSkill")
       
        
        switch num{
        case 0:
            
            let alertController:UIAlertController = UIAlertController(title: "RecoveryLife", message: "体力を一定回復する\n装備しますか？", preferredStyle: .Alert)
            
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                self.skillButton0.enabled = false
                self.skillButton0.setTitle("装備中", forState: .Normal)
                    self.skillButton1.enabled = true
                    self.skillButton1.setTitle("DeathBlow", forState: .Normal)
                    self.skillButton2.enabled = true
                    self.skillButton2.setTitle("TakeItEasy", forState: .Normal)
                    self.skillButton3.enabled = true
                    self.skillButton3.setTitle("UptoMe", forState: .Normal)
                    self.skillButton4.enabled = true
                    self.skillButton4.setTitle("DesperateExplosion", forState: .Normal)
                equipmentSkill = num
               
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)
            
            
        case 1:
            
            let alertController:UIAlertController = UIAlertController(title: "DeathBlow", message: "敵に一定のダメージを与える\n装備しますか？", preferredStyle: .Alert)
            
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                self.skillButton1.enabled = false
                self.skillButton1.setTitle("装備中", forState: .Normal)
                self.skillButton0.enabled = true
                self.skillButton0.setTitle("RecoveryLife", forState: .Normal)
                self.skillButton2.enabled = true
                self.skillButton2.setTitle("TakeItEasy", forState: .Normal)
                self.skillButton3.enabled = true
                self.skillButton3.setTitle("UptoMe", forState: .Normal)
                self.skillButton4.enabled = true
                self.skillButton4.setTitle("DesperateExplosion", forState: .Normal)
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)
        
            
        case 2:
            let alertController:UIAlertController = UIAlertController(title: "TakeItEasy", message: "文章を簡易化させる\n装備しますか？", preferredStyle: .Alert)
            
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                self.skillButton2.enabled = false
                self.skillButton2.setTitle("装備中", forState: .Normal)
                self.skillButton0.enabled = true
                self.skillButton0.setTitle("RecoveryLife", forState: .Normal)
                self.skillButton1.enabled = true
                self.skillButton1.setTitle("DeathBlow", forState: .Normal)
                self.skillButton3.enabled = true
                self.skillButton3.setTitle("UptoMe", forState: .Normal)
                self.skillButton4.enabled = true
                self.skillButton4.setTitle("DesperateExplosion", forState: .Normal)
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)
            
            
        case 3:
            let alertController:UIAlertController = UIAlertController(title: "UptoMe", message: "自分の攻撃力を２倍にする\n装備しますか？", preferredStyle: .Alert)
            
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                self.skillButton3.enabled = false
                self.skillButton3.setTitle("装備中", forState: .Normal)
                self.skillButton0.enabled = true
                self.skillButton0.setTitle("RecoveryLife", forState: .Normal)
                self.skillButton1.enabled = true
                self.skillButton1.setTitle("DeathBlow", forState: .Normal)
                self.skillButton2.enabled = true
                self.skillButton2.setTitle("TakeItEasy", forState: .Normal)
                self.skillButton4.enabled = true
                self.skillButton4.setTitle("DesperateExplosion", forState: .Normal)
                
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)
           
        case 4:
            let alertController:UIAlertController = UIAlertController(title: "DesparateExplosion", message: "自分もダメージを食らうが相手に大ダメージを与える\n装備しますか？", preferredStyle: .Alert)
            
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                self.skillButton4.enabled = false
                self.skillButton4.setTitle("装備中", forState: .Normal)
                self.skillButton0.enabled = true
                self.skillButton0.setTitle("RecoveryLife", forState: .Normal)
                self.skillButton1.enabled = true
                self.skillButton1.setTitle("DeathBlow", forState: .Normal)
                self.skillButton2.enabled = true
                self.skillButton2.setTitle("TakeItEasy", forState: .Normal)
                self.skillButton3.enabled = true
                self.skillButton3.setTitle("UptoMe", forState: .Normal)
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)
            
        default:
            break
        }
        defaults.setInteger(equipmentSkill, forKey: "equipmentSkill")
        defaults.synchronize()
        

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitButtom(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
       
    }
}
