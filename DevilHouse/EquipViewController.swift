//
//  EquipViewController.swift
//  DevilHouse
//
//  Created by Naito Seishiro on 2015/10/09.
//  Copyright © 2015年 Itia. All rights reserved.
//

import UIKit

class EquipViewController: UIViewController {

    var equipment:Equipment?
    var weaponInfo:[(name:String,possesion:Bool)]=[]
    var protectInfo:[(name:String,possesion:Bool)]=[]
    
    
    @IBOutlet weak var weaponButton0: UIButton!
    @IBOutlet weak var weaponButton1: UIButton!
    @IBOutlet weak var weaponButton2: UIButton!
    @IBOutlet weak var weaponButton3: UIButton!
    @IBOutlet weak var weaponButton4: UIButton!
    @IBOutlet weak var protectButton0: UIButton!
    @IBOutlet weak var protectButton1: UIButton!
    @IBOutlet weak var protectButton2: UIButton!
    @IBOutlet weak var protectButton3: UIButton!
    @IBOutlet weak var protectButton4: UIButton!
    var levelfunc:Level?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelfunc = Level()
        let defaults = NSUserDefaults.standardUserDefaults()
        equipment = Equipment()
        weaponInfo = equipment!.readCurrentWeaponInfo()
        protectInfo = equipment!.readCurrentProtectInfo()
        let equipmentWeapon:Int = defaults.integerForKey("equipmentWeapon")
        let level = defaults.integerForKey("level")
        if(level == 0){
            levelfunc!.levelup()
            var upExp:Int = defaults.integerForKey("upExp")
            upExp = 100;
            defaults.setInteger(upExp, forKey: "upExp")
        }
        switch equipmentWeapon{
        case 0:
            self.weaponButton0.enabled = false
            weaponButton0.setTitle("装備中", forState: .Normal)
        case 1:
            self.weaponButton1.enabled = false
            weaponButton1.setTitle("装備中", forState: .Normal)
        case 2:
            self.weaponButton2.enabled = false
            weaponButton2.setTitle("装備中", forState: .Normal)
        case 3:
            self.weaponButton3.enabled = false
            weaponButton3.setTitle("装備中", forState: .Normal)
        case 4:
            self.weaponButton4.enabled = false
            weaponButton4.setTitle("装備中", forState: .Normal)
        default:
            break
        }
        
        let equipmentProtect:Int = defaults.integerForKey("equipmentProtect")
        
        switch equipmentProtect{
        case 0:
            self.protectButton0.enabled = false
            protectButton0.setTitle("装備中", forState: .Normal)
        case 1:
            self.protectButton1.enabled = false
            protectButton1.setTitle("装備中", forState: .Normal)
        case 2:
            self.protectButton2.enabled = false
            protectButton2.setTitle("装備中", forState: .Normal)
        case 3:
            self.protectButton3.enabled = false
            protectButton3.setTitle("装備中", forState: .Normal)
        case 4:
            self.protectButton4.enabled = false
            protectButton4.setTitle("装備中", forState: .Normal)
        default:
            break
        }

    
    
        for(var i = 0;i<5;i++){
            let weapon:(name:String,possesion:Bool) = weaponInfo[i]
            let protect:(name:String,possesion:Bool) = protectInfo[i]
        
            if(weapon.possesion == false){
                switch i{
                case 0:
                    self.weaponButton0.enabled = false
                    weaponButton0.setTitle("未購入", forState: .Normal)
                case 1:
                    self.weaponButton1.enabled = false
                    weaponButton1.setTitle("未購入", forState: .Normal)
                case 2:
                    self.weaponButton2.enabled = false
                    weaponButton2.setTitle("未購入", forState: .Normal)
                case 3:
                    self.weaponButton3.enabled = false
                    weaponButton3.setTitle("未購入", forState: .Normal)
                case 4:
                    self.weaponButton4.enabled = false
                    weaponButton4.setTitle("未購入", forState: .Normal)
                default:
                    break
                }
            }
            
            if(protect.possesion == false){
                switch i{
                case 0:
                    self.protectButton0.enabled = false
                    protectButton0.setTitle("未購入", forState: .Normal)
                case 1:
                    self.protectButton1.enabled = false
                    protectButton1.setTitle("未購入", forState: .Normal)
                case 2:
                    self.protectButton2.enabled = false
                    protectButton2.setTitle("未購入", forState: .Normal)
                case 3:
                    self.protectButton3.enabled = false
                    protectButton3.setTitle("未購入", forState: .Normal)
                case 4:
                    self.protectButton4.enabled = false
                    protectButton4.setTitle("未購入", forState: .Normal)
                default:
                    break
                }
            }

        }
    
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choiceWeapon(sender: UIButton) {
        let num:Int = sender.tag
        let defaults = NSUserDefaults.standardUserDefaults()
        var equipmentWeapon:Int = defaults.integerForKey("equipmentWeapon")
        
        switch equipmentWeapon{
        case 0:
            self.weaponButton0.enabled = true
            weaponButton0.setTitle("木の剣", forState: .Normal)
        case 1:
            self.weaponButton1.enabled = true
            weaponButton1.setTitle("勇者の剣", forState: .Normal)
        case 2:
            self.weaponButton2.enabled = true
            weaponButton2.setTitle("ロンギヌス", forState: .Normal)
        case 3:
            self.weaponButton3.enabled = true
            weaponButton3.setTitle("エクスカリバー", forState: .Normal)
        case 4:
            self.weaponButton4.enabled = true
            weaponButton4.setTitle("伝説の剣", forState: .Normal)
        default:
            break
        }
        equipmentWeapon = num
        switch equipmentWeapon{
        case 0:
            self.weaponButton0.enabled = false
            weaponButton0.setTitle("装備中", forState: .Normal)
        case 1:
            self.weaponButton1.enabled = false
            weaponButton1.setTitle("装備中", forState: .Normal)
        case 2:
            self.weaponButton2.enabled = false
            weaponButton2.setTitle("装備中", forState: .Normal)
        case 3:
            self.weaponButton3.enabled = false
            weaponButton3.setTitle("装備中", forState: .Normal)
        case 4:
            self.weaponButton4.enabled = false
            weaponButton4.setTitle("装備中", forState: .Normal)
        default:
            break
        }
        
        defaults.setInteger(equipmentWeapon, forKey: "equipmentWeapon")
    }
    
    @IBAction func choiceProtect(sender: UIButton){
        let num:Int = sender.tag
        let defaults = NSUserDefaults.standardUserDefaults()
        var equipmentProtect:Int = defaults.integerForKey("equipmentProtect")
       
        switch equipmentProtect{
        case 0:
        self.protectButton0.enabled = true
        protectButton0.setTitle("木の盾", forState: .Normal)
        case 1:
        self.protectButton1.enabled = true
        protectButton1.setTitle("イージス", forState: .Normal)
        case 2:
        self.protectButton2.enabled = true
        protectButton2.setTitle("プリトウェン", forState: .Normal)
        case 3:
        self.protectButton3.enabled = true
        protectButton3.setTitle("勇者の盾", forState: .Normal)
        case 4:
        self.protectButton4.enabled = true
        protectButton4.setTitle("伝説の盾", forState: .Normal)
        default:
        break
    }

        equipmentProtect = num
        
        switch equipmentProtect{
        case 0:
            self.protectButton0.enabled = false
            protectButton0.setTitle("装備中", forState: .Normal)
        case 1:
            self.protectButton1.enabled = false
            protectButton1.setTitle("装備中", forState: .Normal)
        case 2:
            self.protectButton2.enabled = false
            protectButton2.setTitle("装備中", forState: .Normal)
        case 3:
            self.protectButton3.enabled = false
            protectButton3.setTitle("装備中", forState: .Normal)
        case 4:
            self.protectButton4.enabled = false
            protectButton4.setTitle("装備中", forState: .Normal)
        default:
            break
        }

        defaults.setInteger(equipmentProtect, forKey: "equipmentProtect")
    }

    
    @IBAction func exitButtom(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
