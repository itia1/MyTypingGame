//
//  Level.swift
//  DevilHouse
//
//  Created by Naito Seishiro on 2015/10/18.
//  Copyright © 2015年 Itia. All rights reserved.
//

import UIKit

class Level: NSObject {
    
    func getExp(exp:Int) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var sumExp:Int = userDefaults.integerForKey("sumExp")
        let level:Int = userDefaults.integerForKey("level")
        var upExp:Int = userDefaults.integerForKey("upExp")
        sumExp += exp
        if(level == 0){
            levelup()
            upExp = 100;
        }
        if(sumExp >= upExp){
            levelup()
            sumExp = 0
            upExp += 10
        }
        userDefaults.setInteger(sumExp, forKey: "sumExp")
        userDefaults.setInteger(upExp, forKey: "upExp") 
    }
    
    
    func  levelup(){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var attack:Int = userDefaults.integerForKey("attack")
        var hp:Int = userDefaults.integerForKey("hp")
        var def:Int = userDefaults.integerForKey("def")
        var spd:Int = userDefaults.integerForKey("spd")
        var level:Int = userDefaults.integerForKey("level")
        
        if(level == 0){
            attack = 10
            hp = 100
            def = 10
            spd = 10
            level = 1
            var equipmentWeapon = userDefaults.integerForKey("equipmentWeapon")
            var equipmentProtect = userDefaults.integerForKey("equipmentProtect")
            equipmentWeapon = 5
            equipmentProtect = 5
            userDefaults.setInteger(equipmentWeapon, forKey: "equipmentWeapon")
            userDefaults.setInteger(equipmentProtect, forKey: "equipmentProtect")
        }else if(0 == level%4){
            hp++
            def++
            
        }else if(1 == level%4){
            attack++
        }else if(2 == level%4){
            hp++
            spd++
        }else {
            hp++
        }
        level++
        userDefaults.setInteger(level, forKey: "level")
        userDefaults.setInteger(attack, forKey: "attack")
        userDefaults.setInteger(def, forKey: "def")
        userDefaults.setInteger(spd, forKey: "spd")
        userDefaults.setInteger(hp, forKey: "hp")
        userDefaults.synchronize()
    }
    
    
}
