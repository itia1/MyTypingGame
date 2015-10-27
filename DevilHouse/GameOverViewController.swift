//
//  GameOverViewController.swift
//  DevilHouse
//
//  Created by Naito Seishiro on 2015/10/08.
//  Copyright © 2015年 Itia. All rights reserved.
//

import UIKit
import Social

class GameOverViewController: UIViewController {

    @IBOutlet weak var floor: UILabel!
    
    @IBOutlet weak var time: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func postTwitter(sender: AnyObject) {
        let twitter:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        twitter.setInitialText("魔王の城：クリアできませんでした。。。。")
        self.presentViewController(twitter, animated: true, completion: nil)
    }

}
