//
//  Money.swift
//  DevilHouse
//
//  Created by Naito Seishiro on 2015/10/17.
//  Copyright © 2015年 Itia. All rights reserved.
//


import UIKit

class MoneyGet:NSObject{
    func MoneyGet(money:Int) {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        var moneyCount:Int = userDefaults.integerForKey("moneyCount")
        
        moneyCount += money
        //Label.text = String(moneyCount)
        
        userDefaults.setInteger(moneyCount, forKey: "moneyCount")
    }
    
    func MoneyUse(money:Int) {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        var moneyCount:Int = userDefaults.integerForKey("moneyCount")
        
        moneyCount -= money
        //Label.text = String(moneyCount)
        
        userDefaults.setInteger(moneyCount, forKey: "moneyCount")
        
    }
    
    func MoneyAppear() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let moneyCount:Int = userDefaults.integerForKey("moneyCount")
        //Label.text = String(moneyCount)
        
        
    }

}