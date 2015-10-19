//
//  equipmentData.swift
//  DevilHouse
//
//  Created by Naito Seishiro on 2015/10/19.
//  Copyright © 2015年 Itia. All rights reserved.
//

import UIKit

class equipmentData: NSObject {
    
    
    func weaponsData(num:Int) -> (Int){
        var attackData:Int
        switch num{
        case 0:
             attackData = 2
        case 1:
             attackData = 5
        case 2:
             attackData = 8
        case 3:
             attackData = 10
        case 4:
             attackData = 15
        default:
             attackData = 0
        }
        return attackData
    }
    
    func protectData(num:Int) -> (Int){
        var protectData:Int
        switch num{
        case 0:
            protectData = 2
        case 1:
            protectData = 5
        case 2:
            protectData = 8
        case 3:
            protectData = 10
        case 4:
            protectData = 15
        default:
            protectData = 0
        }
        
    
        return protectData
    }
    
}
