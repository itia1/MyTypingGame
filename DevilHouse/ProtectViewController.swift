//
//  ProtectViewController.swift
//  typing ver1,2
//
//  Created by Naito Seishiro on 2015/08/31.
//  Copyright (c) 2015年 Itia. All rights reserved.
//

import UIKit

class ProtectViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        equipment = Equipment()
        protectInfo = equipment!.readCurrentProtectInfo()
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func buying(sender: UIButton) {
        let num:Int = sender.tag
        let protect:(name:String,possesion:Bool) = protectInfo[num-1]
        let fuckError:Equipment.ErrorCheck = (equipment?.changeProtectPossesion(protect.name))!
        
        if fuckError == Equipment.ErrorCheck.Error{
            print("this is error");
        }
    }
    @IBAction func exitButtom(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



