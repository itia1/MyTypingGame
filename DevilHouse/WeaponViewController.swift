//
//  WeaponViewController.swift
//  typing ver1,2
//
//  Created by Naito Seishiro on 2015/08/31.
//  Copyright (c) 2015年 Itia. All rights reserved.
//

import UIKit

class WeaponViewController: UIViewController {

    var equipment:Equipment?
    var money:Money?
    var weaponInfo:[(name:String,possesion:Bool)]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
         equipment = Equipment()
         weaponInfo = equipment!.readCurrentWeaponInfo()
        // Do any additional setup after loading the view.
        money = Money()
        let bbb:Int = money!.MoneyAppear()
        aaa.text = String(bbb)
        serihu.text = "へいらっしゃい！\n今日は何を買うんだい"
        
        for(var i = 0;i<5;i++){
            let weapon:(name:String,possesion:Bool) = weaponInfo[i]
        if(weapon.possesion == true){
            switch i{
            case 0:
                self.Button1.enabled = false
            case 1:
                self.Button2.enabled = false
               
            case 2:
                self.Button3.enabled = false
            case 3:
                self.Button4.enabled = false
            case 4:
                self.Button5.enabled = false
            default:
                break
                }
            }
        }
    }
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var aaa: UILabel!

    @IBOutlet weak var serihu: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func exitButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func buttonTapped(sender : AnyObject) {
        switch sender.tag {
        case 1:
            let alertController:UIAlertController = UIAlertController(title: "木の剣", message: "購入しますか？", preferredStyle: .Alert)
            
            
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                let num:Int = sender.tag
                self.Button1.enabled = false
                let weapon:(name:String,possesion:Bool) = self.weaponInfo[num-1]
                self.equipment!.changeWeaponPossesion(weapon.name)
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)

            
        case 2:
            let alertController:UIAlertController = UIAlertController(title: "勇者の剣", message: "購入しますか？", preferredStyle: .Alert)
            
            
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                let num:Int = sender.tag
                self.Button2.enabled = false
                let weapon:(name:String,possesion:Bool) = self.weaponInfo[num-1]
                self.equipment!.changeWeaponPossesion(weapon.name)
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)
    
        case 3:
            let alertController:UIAlertController = UIAlertController(title: "ロンギヌス", message: "購入しますか？", preferredStyle: .Alert)
            
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                let num:Int = sender.tag
                 self.Button3.enabled = false
                let weapon:(name:String,possesion:Bool) = self.weaponInfo[num-1]
                self.equipment!.changeWeaponPossesion(weapon.name)
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)
            self.Button3.enabled = false
            
        case 4:
            let alertController:UIAlertController = UIAlertController(title: "エクスカリバー", message: "購入しますか？", preferredStyle: .Alert)
            
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                let num:Int = sender.tag
                self.Button4.enabled = false
                let weapon:(name:String,possesion:Bool) = self.weaponInfo[num-1]
                self.equipment!.changeWeaponPossesion(weapon.name)
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)
            
        case 5:
            let alertController:UIAlertController = UIAlertController(title: "課金の剣", message: "購入しますか？", preferredStyle: .Alert)
            
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                let num:Int = sender.tag
                self.Button5.enabled = false
                let weapon:(name:String,possesion:Bool) = self.weaponInfo[num-1]
                self.equipment!.changeWeaponPossesion(weapon.name)
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
    }
    
}
