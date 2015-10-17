//
//  Equipment.swift
//  DevilHouse
//
//  Created by Ark on 2015/10/02.
//  Copyright © 2015年 Itia. All rights reserved.
//

import UIKit

class Equipment:NSObject{
    
    //保存された武器情報を返す関数
    func readCurrentWeaponInfo() -> [(name:String,possesion:Bool)]{
        let defaults = NSUserDefaults.standardUserDefaults()
        var weapons:[String]? = defaults.objectForKey("key-weapons") as? [String]
        var weaponPossesions:[Bool]? = defaults.objectForKey("key-weaponPossesions") as? [Bool]
        var weaponInfo:[(name:String,possesion:Bool)] = []
        
        //この関数を初めて呼んだときに武器情報を初期化して保存
        if ((weapons == nil) || (weaponPossesions == nil)){
            weapons = ["木の剣","勇者の剣","ロンギヌス","エクスカリバー","課金の剣"]
            weaponPossesions = [false,false,false,false,false]
            
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
                defaults.setObject(weaponPossesions, forKey: "key-weaponPossesions")
                defaults.synchronize()
            //該当武器がないとき
            }else if(i == weapons?.count){
                return ErrorCheck.Error
            }
            return ErrorCheck.OK
        }
    }
    
    
    func readCurrentProtectInfo() -> [(name:String,possesion:Bool)]{
        let defaults = NSUserDefaults.standardUserDefaults()
        var protect:[String]? = defaults.objectForKey("key-protect") as? [String]
        var protectPossesions:[Bool]? = defaults.objectForKey("key-protectPossesions") as? [Bool]
        var protectInfo:[(name:String,possesion:Bool)] = []
        
        //この関数を初めて呼んだときに防具情報を初期化して保存
        if ((protect == nil) || (protectPossesions == nil)){
            protect = ["木の盾","勇者の盾","アイスシールド","ファイヤーシールド","ダークシールド"]
            protectPossesions = [false,false,false,false,false]
            
            defaults.setObject(protect, forKey: "key-protect")
            defaults.setObject(protectPossesions, forKey: "key-protectPossesions")
            defaults.synchronize()
        }
        
        for (var i=0;i<protect?.count;i++){
            protectInfo.append((protect![i],protectPossesions![i]))
        }
        
        return protectInfo
    }

    func changeProtectPossesion(name:String) -> ErrorCheck{
        let defaults = NSUserDefaults.standardUserDefaults()
        let protect:[String]? = defaults.objectForKey("key-protect") as? [String]
        var protectPossesions:[Bool]? = defaults.objectForKey("key-protectPossesions") as? [Bool]
        var i=0
        //保存されたものがないときはエラーを返す
        if ((protect == nil) || (protectPossesions == nil)){
            return ErrorCheck.Error
            //保存されたものがあれば
        }else{
            //nameに該当する防具が見つかるか登録してある防具個数を超えるまでiを増加して検索
            while(i<protect?.count && protect?[i] != name){
                i++
            }
            //該当防具が見つかったとき
            if i<protect?.count{
                //所持情報を逆転する
                if (protectPossesions?[i] == true){
                    protectPossesions?[i] = false
                }else{
                    protectPossesions?[i] = true
                }
                defaults.setObject(protectPossesions, forKey: "key-protectPossesions")
                defaults.synchronize()
                //該当防具がないとき
            }else if(i == protect?.count){
                return ErrorCheck.Error
            }
            return ErrorCheck.OK
        }
    }
    enum ErrorCheck{case OK, Error}
}