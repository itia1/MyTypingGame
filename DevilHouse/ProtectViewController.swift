//
//  ProtectViewController.swift
//  typing ver1,2
//
//  Created by Naito Seishiro on 2015/08/31.
//  Copyright (c) 2015年 Itia. All rights reserved.
//

import UIKit

class ProtectViewController: UIViewController {

    var equipment:Equipment?
    var money:Money?
    var protectInfo:[(name:String,possesion:Bool)]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        equipment = Equipment()
        money = Money()
        protectInfo = equipment!.readCurrentProtectInfo()
        let bbb:Int = money!.MoneyAppear()
        aaa.text = String(bbb)
        // Do any additional setup after loading the view.

    }
    
    
    @IBOutlet weak var aaa: UILabel!
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
            
            let protect:(name:String,possesion:Bool) = self.protectInfo[num-1]
            self.equipment!.changeProtectPossesion(protect.name)
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .Destructive){
            (action) -> Void in
            
        }
        
        alertController.addAction(actionCancel)
        alertController.addAction(actionOK)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    

    @IBAction func exitButtom(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}


