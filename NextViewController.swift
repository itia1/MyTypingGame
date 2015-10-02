//
//  NextViewController.swift
//  DevilHouse
//
//  Created by Naito Seishiro on 2015/10/02.
//  Copyright (c) 2015年 Itia. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var count = 2
    @IBOutlet weak var countPicture: UIImageView!
    var countPicture1 = UIImage(named:"number1.png")
    var countPicture2 = UIImage(named:"number2.png")
    var countPicture3 = UIImage(named:"number3.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
         NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: "countdown", userInfo: nil, repeats: true)
        countPicture.image = countPicture3
    }

        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func countdown(){
        if(count==2){
            countPicture.image = countPicture2
        }else if(count==1){
            countPicture.image = countPicture1
        }else{
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("NextViewController")
            as! UIViewController
            next.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
                
            self.presentViewController(next, animated: true, completion: nil)

        }
        
        count--;
        
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

