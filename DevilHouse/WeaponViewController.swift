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
    @IBAction func buying(sender: UIButton) {
        let num:Int = sender.tag
        let weapon:(name:String,possesion:Bool) = weaponInfo[num-1]
        let fuckError:Equipment.ErrorCheck = (equipment?.changeWeaponPossesion(weapon.name))!
        
        if fuckError == Equipment.ErrorCheck.Error{
            print("this is error");
        }
    }
    
  /*  @IBAction func Weapon1(sender: AnyObject) {
        var appDelegate0:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate0.weapon[0] = "1"
    }
*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
