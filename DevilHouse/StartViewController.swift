//
//  StartViewController.swift
//  typing ver1,2
//
//  Created by Naito Seishiro on 2015/08/30.
//  Copyright (c) 2015年 Itia. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    var levelfunc:Level?
    override func viewDidLoad() {
        super.viewDidLoad()
         levelfunc = Level()
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let level:Int = userDefaults.integerForKey("level")
        if(level == 0){
            levelfunc!.levelup()
            var upExp:Int = userDefaults.integerForKey("upExp")
            upExp = 100;
            userDefaults.setInteger(upExp, forKey: "upExp")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
