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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
