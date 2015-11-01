//
//  TownViewController.swift
//  typing ver1,2
//
//  Created by Naito Seishiro on 2015/08/30.
//  Copyright (c) 2015年 Itia. All rights reserved.
//

import UIKit
import AVFoundation

class TownViewController: UIViewController {
    var bgmplayer = AVAudioPlayer()
    let townbgm = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("town", ofType: "mp3")!)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgmplayer = try! AVAudioPlayer(contentsOfURL: townbgm)
        bgmplayer.play()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func exitTown(sender: AnyObject) {
        bgmplayer.stop()
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
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
