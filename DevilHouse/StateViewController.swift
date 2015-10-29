//
//  StateViewController.swift
//  DevilHouse
//
//  Created by Naito Seishiro on 2015/10/09.
//  Copyright © 2015年 Itia. All rights reserved.
//

import UIKit

class StateViewController: UIViewController {
    
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defLabel: UILabel!
    @IBOutlet weak var speLabel: UILabel!
    @IBOutlet weak var BestScore: UILabel!
    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var protectLabel: UILabel!
    @IBOutlet weak var weaponLabel: UILabel!
    var levelfunc:Level?
    var EquipmentData:equipmentData?
    var weaponData:Int = 0
    var protectData:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        levelfunc = Level()
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let level:Int = userDefaults.integerForKey("level")
        if(level == 0){
            levelfunc!.levelup()
            var upExp:Int = userDefaults.integerForKey("upExp")
            upExp = 100;
             userDefaults.setInteger(upExp, forKey: "upExp")
        }
        let equipmentWeapon:Int = userDefaults.integerForKey("equipmentWeapon")
        let equipmentProtect:Int = userDefaults.integerForKey("equipmentProtect")
        EquipmentData = equipmentData()
        weaponData = EquipmentData!.weaponsData(equipmentWeapon)
        protectData = EquipmentData!.protectData(equipmentProtect)
        let leveltext:Int = userDefaults.integerForKey("level")
        let attack:Int =  userDefaults.integerForKey("attack")
        let hp:Int = userDefaults.integerForKey("hp")
        let def:Int = userDefaults.integerForKey("def")
        let spd:Int = userDefaults.integerForKey("spd")
        levelLabel.text = String(leveltext)
        hpLabel.text = String(hp)
        attackLabel.text = String(attack+weaponData)
        defLabel.text = String(def+protectData)
        speLabel.text = String(spd)
        let equipmentSkill = userDefaults.integerForKey("equipmentSkill")
        
        switch equipmentSkill {
        case 0:
            skillLabel.text = "RecoveryLife"
        case 1:
            skillLabel.text = "DeathBlow"
        case 2:
            skillLabel.text = "TakeItEasy"
        case 3:
            skillLabel.text = "UptoMe"
        case 4:
            skillLabel.text = "DesperateExplosion"
        default:
            break
            
        }
        userDefaults.setInteger(equipmentSkill, forKey: "equipmentSkill")
        
        switch equipmentWeapon{
        case 0:
            weaponLabel.text = "木の剣"
        case 1:
            weaponLabel.text = "勇者の剣"
        case 2:
            weaponLabel.text = "ロンギヌス"
        case 3:
            weaponLabel.text = "エクスカリバー"
        case 4:
            weaponLabel.text = "伝説の剣"
        case 5:
            weaponLabel.text = "装備なし"
        default:
            break
        }
        userDefaults.setInteger(equipmentWeapon, forKey: "equipmentWeapon")
        
        switch equipmentProtect{
        case 0:
            protectLabel.text = "木の盾"
        case 1:
            protectLabel.text = "イージス"
        case 2:
            protectLabel.text = "プリトウェン"
        case 3:
            protectLabel.text = "勇者の盾"
        case 4:
            protectLabel.text = "伝説の盾"
        case 5:
            protectLabel.text = "装備なし"
        default:
            break
        }
        userDefaults.setInteger(equipmentProtect, forKey: "equipmentProtect")
        userDefaults.synchronize()
    }

        // Do any additional setup after loading the view.
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    @IBAction func exitButtom(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
