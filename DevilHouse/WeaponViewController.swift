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
    var weaponInfo:[(name:String,possesion:Bool)]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
         equipment = Equipment()
         weaponInfo = equipment!.readCurrentWeaponInfo()
        // Do any additional setup after loading the view.
        
 
        
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func exitButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func buttonTapped(sender : AnyObject) {
        // UIAlertController
        let alertController:UIAlertController = UIAlertController(title: "Alert", message: "Test UIAlertController", preferredStyle: .Alert)
        
        // 選択肢
        // 異なる方法でactionを設定してみた
        let actionOK = UIAlertAction(title: "OK", style: .Default){
            action in
            let num:Int = sender.tag
            
         let weapon:(name:String,possesion:Bool) = self.weaponInfo[num-1]
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .Cancel){
            (action) -> Void in
           
        }
        
        // actionを追加
        alertController.addAction(actionCancel)
        alertController.addAction(actionOK)
        
        // UIAlertの起動
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}
