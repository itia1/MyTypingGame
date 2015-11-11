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
    @IBOutlet weak var moneyText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        equipment = Equipment()
        money = Money()
        protectInfo = equipment!.readCurrentProtectInfo()
        let bbb:Int = money!.MoneyAppear()
        moneyText.text = String(format: "現在のお金:\(bbb)")
     //   aaa.text = String(bbb)
        // Do any additional setup after loading the view.

        for(var i = 0;i<5;i++){
            let protect:(name:String,possesion:Bool) = protectInfo[i]
            if(protect.possesion == true){
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func exitButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func buttonTapped(sender : AnyObject) {
        
        switch sender.tag{
            
        case 1:
             let alertController:UIAlertController = UIAlertController(title: "木の盾", message: "購入しますか？", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                let num:Int = sender.tag
                
                let protect:(name:String,possesion:Bool) = self.protectInfo[num-1]
                self.equipment!.changeProtectPossesion(protect.name)
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
             alertController.addAction(actionCancel)
             alertController.addAction(actionOK)
             presentViewController(alertController, animated: true, completion: nil)
            self.Button1.enabled = false
            
        case 2:
            let alertController:UIAlertController = UIAlertController(title: "イージス", message: "購入しますか？", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                let num:Int = sender.tag
                
                let protect:(name:String,possesion:Bool) = self.protectInfo[num-1]
                self.equipment!.changeProtectPossesion(protect.name)
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)
            self.Button2.enabled = false
            
        case 3:
            let alertController:UIAlertController = UIAlertController(title: "プリトウェン", message: "購入しますか？", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                let num:Int = sender.tag
                
                let protect:(name:String,possesion:Bool) = self.protectInfo[num-1]
                self.equipment!.changeProtectPossesion(protect.name)
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)
            self.Button3.enabled = false

        case 4:
            let alertController:UIAlertController = UIAlertController(title: "勇者の盾", message: "購入しますか？", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                let num:Int = sender.tag
                
                let protect:(name:String,possesion:Bool) = self.protectInfo[num-1]
                self.equipment!.changeProtectPossesion(protect.name)
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)
            self.Button4.enabled = false

        case 5:
            let alertController:UIAlertController = UIAlertController(title: "課金の盾", message: "購入しますか？", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "はい", style: .Default){
                action in
                let num:Int = sender.tag
                
                let protect:(name:String,possesion:Bool) = self.protectInfo[num-1]
                self.equipment!.changeProtectPossesion(protect.name)
            }
            let actionCancel = UIAlertAction(title: "いいえ", style: .Destructive){
                (action) -> Void in
                
            }
            alertController.addAction(actionCancel)
            alertController.addAction(actionOK)
            presentViewController(alertController, animated: true, completion: nil)
            self.Button5.enabled = false

        default:
            break
            
        }
    }
    

    @IBAction func exitButtom(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}


