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
    }
   
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
        let alertController:UIAlertController = UIAlertController(title: "Alert", message: "Test UIAlertController", preferredStyle: .Alert)
        
       
        let actionOK = UIAlertAction(title: "OK", style: .Default){
            action in
            let num:Int = sender.tag
            
         let weapon:(name:String,possesion:Bool) = self.weaponInfo[num-1]
            self.equipment!.changeWeaponPossesion(weapon.name)
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .Destructive){
            (action) -> Void in
           
        }
        
        alertController.addAction(actionCancel)
        alertController.addAction(actionOK)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}
