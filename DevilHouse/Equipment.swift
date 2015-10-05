//
//  Equipment.swift
//  DevilHouse
//
//  Created by Ark on 2015/10/02.
//  Copyright © 2015年 Itia. All rights reserved.
//

import Foundation
import UIKit

class Equipment:NSObject{
    
    var bag=0
    
    //保存された武器情報を返す関数
    func readCurrentWeaponInfo() -> [(name:String,possesion:Bool)]{
        let defaults = NSUserDefaults.standardUserDefaults()
        var weapons:[String]? = defaults.objectForKey("key-weapons") as? [String]
        var weaponPossesions:[Bool]? = defaults.objectForKey("key-weaponPossesions") as? [Bool]
        var weaponInfo:[(name:String,possesion:Bool)] = []
        
        //この関数を初めて呼んだときに武器情報を初期化して保存
        if ((weapons == nil) || (weaponPossesions == nil)){
            weapons = ["魔法の剣","魔法の杖"]
            weaponPossesions = [false,false]
            
            defaults.setObject(weapons, forKey: "key-weapons")
            defaults.setObject(weaponPossesions, forKey: "key-weaponPossesions")
            defaults.synchronize()
        }
        
        for (var i=0;i<weapons?.count;i++){
            weaponInfo.append((weapons![i],weaponPossesions![i]))
        }
        
        return weaponInfo
    }
    
    //保存された武器の所持情報を変更する関数
    func changeWeaponPossesion(name:String) -> ErrorCheck{
        let defaults = NSUserDefaults.standardUserDefaults()
        let weapons:[String]? = defaults.objectForKey("key-weapons") as? [String]
        var weaponPossesions:[Bool]? = defaults.objectForKey("key-weaponPossesions") as? [Bool]
        var i=0
        //保存されたものがないときはエラーを返す
        if ((weapons == nil) || (weaponPossesions == nil)){
            return ErrorCheck.Error
        //保存されたものがあれば
        }else{
            //nameに該当する武器が見つかるか登録してある武器個数を超えるまでiを増加して検索
            while(i<weapons?.count && weapons?[i] != name){
                i++
            }
            //該当武器が見つかったとき
            if i<weapons?.count{
                //所持情報を逆転する
                if (weaponPossesions?[i] == true){
                    weaponPossesions?[i] = false
                }else{
                    weaponPossesions?[i] = true
                }
            //該当武器がないとき
            }else if(i == weapons?.count){
                return ErrorCheck.Error
            }
            return ErrorCheck.OK
        }
    }
    
    enum ErrorCheck{case OK, Error}
}