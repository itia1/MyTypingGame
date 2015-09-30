//
//  ViewController.swift
//  typing ver1,2
//
//  Created by Naito Seishiro on 2015/08/22.
//  Copyright (c) 2015年 Itia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var HitPoint: UILabel!
    @IBOutlet weak var Count: UILabel!
    @IBOutlet weak var trueText: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var Picture: UIImageView!
    @IBOutlet weak var AttackEffect: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var myHitPoint: UILabel!
    @IBOutlet weak var HpBar: UIProgressView!
    @IBOutlet weak var myHpBar: UIProgressView!
    
    var test = 1
    
    var counter = 0
    var hp = 100
    var text:[String]=["a","b","c","d","e","f","g"]
    var startTime: NSTimeInterval? = nil
    var timer: NSTimer?
    var startTime2: NSTimeInterval? = nil
    var timer2: NSTimer?
    var myhp = 100
    
    
    var monster1 = UIImage(named:"cat1.png")
    
    var monster1damage = [
                        UIImage(named:"cat1.png")!,
                        UIImage(named:"cat1damage.png")!
                        ]
    
    
    //攻撃エフェクト　いらないかも
    var attackeffect = [
                        UIImage(named:"attack1.png")!,
                        UIImage(named:"attack2.png")!,
                        UIImage(named:"attack3.png")!,
                        UIImage(named:"attack4.png")!
                        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        var randInt = Int(arc4random_uniform(UInt32(text.count)))
        randInt = randInt%2
        trueText.text = text[randInt]
        Count.text = String(counter)
        HitPoint.text = String(hp)
        myHitPoint.text = String(myhp)
         self.startTime = NSDate.timeIntervalSinceReferenceDate()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        self.startTime2 = NSDate.timeIntervalSinceReferenceDate()
        self.timer2 = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("attack"), userInfo: nil, repeats: true)
        
       
        
        HpBar.progress = 1.0
        myHpBar.progress = 1.0
 
        Picture.image = monster1
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func attack() {
        if let t = self.startTime2{
            let time: Double = NSDate.timeIntervalSinceReferenceDate() - t
            let sec: Int = Int(time)
            if(sec%5 == 0){
        myhp = myhp - 5
        myHitPoint.text = String(myhp)
        myHpBar.setProgress(myHpBar.progress - 0.05, animated: true)
            }
            if(myhp <= 0){
                //ゲームオーバーの処理
             }
        }
    }
    
    func update() {
        if let t = self.startTime {
            let time: Double = NSDate.timeIntervalSinceReferenceDate() - t
            let sec: Int = Int(time)
            let msec: Int = Int((time - Double(sec)) * 100.0)
             self.timerLabel.text = String(format: "%02d:%02d:%02d", sec/60, sec%60, msec)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if(textField.text==trueText.text){
            
            hp = hp-50;
            HpBar.setProgress(HpBar.progress - 0.5 , animated: true)
            
            AttackEffect.animationImages = attackeffect
            AttackEffect.animationRepeatCount = 1
            AttackEffect.animationDuration = 0.3
            AttackEffect.startAnimating()
            
            Picture.animationImages = monster1damage
            Picture.animationRepeatCount = 3
            Picture.animationDuration = 0.2
            Picture.startAnimating()
            
            if( hp <= 0){
                counter++;
                hp = 100 + counter*10
                HpBar.setProgress(1.0 ,  animated: true)
                self.startTime2 = nil
                self.startTime2 = NSDate.timeIntervalSinceReferenceDate()
               
            }
            var randInt2 = Int(arc4random_uniform(UInt32(text.count)))
            randInt2 = randInt2%2
            randInt2 = randInt2 + counter;
            trueText.text = text[randInt2]
            Count.text = String(counter)
            HitPoint.text = String(hp)
        }
        self.textField.text=""
        textField.resignFirstResponder()
        return true
    }
    
}
