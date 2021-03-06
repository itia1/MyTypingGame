//
//  ClearViewController.swift
//  DevilHouse
//
//  Created by Naito Seishiro on 2015/10/08.
//  Copyright © 2015年 Itia. All rights reserved.
//

import UIKit
import Social

class ClearViewController: UIViewController {
    var levelfunc:Level?
    var moneyfunc:Money?
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var floor: UILabel!
    @IBOutlet weak var kekka: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        levelfunc = Level()
        moneyfunc = Money()
        let app:AppDelegate =
        (UIApplication.sharedApplication().delegate as! AppDelegate)
        let timeCount1 = app.timeCount
        let sec: Int = Int(timeCount1)
        let msec: Int = Int((timeCount1 - Double(sec)) * 100.0)
        self.time.text = String(format: "Time:%02d:%02d:%02d", sec/60, sec%60, msec)
        let hierarchyCount = app.hierarchy
        floor.text = String(format: "階層:\(hierarchyCount)")
        let money = sec * hierarchyCount
        let exp = 100
        kekka.text = String(format: "金:\(money) exp:\(exp)入手しました")
        moneyfunc!.MoneyGet(money)
        levelfunc!.getExp(exp)

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func postTwitter(sender: AnyObject) {
        let Twitter:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        Twitter.setInitialText("魔王の城：クリアしました！！！")
        self.presentViewController(Twitter, animated: true, completion: nil)
    }

}
