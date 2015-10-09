//
//  ViewController.swift
//  typing ver1,2
//
//  Created by Naito Seishiro on 2015/08/22.
//  Copyright (c) 2015年 Itia. All rights reserved.
//





// 2015/10/5 敵画像について
//　　　使いたい画像の名前をmonster？.pngにしてフォルダに突っ込んで、元から入っていた仮の画像を削除して下さい
//　　　？の数値は階層に対応しています（1〜5）
//     画像は必ず透過してください
//     被ダメージ時の点滅は画像の階層数値の後ろにdamageを付けて突っ込んで下さい
//     今は明転で点滅をやってるけどもっといい感じのやつがあるかもしれない

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
    var character:Character?
    var counter = 1
    var hp = 100
    var text:[String]=[]
    var startTime: NSTimeInterval? = nil
    var timer: NSTimer?
    var startTime2: NSTimeInterval? = nil 
    var timer2: NSTimer?
    var myhp = 100
    
    
    var monster1 = UIImage(named:"monster1.png")
    
    var monster1damage = [
                        UIImage(named:"monster1.png")!,
                        UIImage(named:"monster1damage.png")!
                        ]
    
    var monster2 = UIImage(named:"monster2.png")
    
    var monster2damage = [
                        UIImage(named:"monster2.png")!,
                        UIImage(named:"monster2damage.png")!
                        ]
    var monster3 = UIImage(named:"monster3.png")
    
    var monster3damage = [
                        UIImage(named:"monster3.png")!,
                        UIImage(named:"monster3damage.png")!
    ]
    
    var monster4 = UIImage(named:"monster4.png")
    
    var monster4damage = [
                        UIImage(named:"monster4.png")!,
                        UIImage(named:"monster4damage.png")!
    ]
    
    var monster5 = UIImage(named:"monster5.png")
    
    var monster5damage = [
                        UIImage(named:"monster5.png")!,
                        UIImage(named:"monster5damage.png")!
    ]
    
    var attackeffect = [
                        UIImage(named:"attack1.png")!,
                        UIImage(named:"attack2.png")!,
                        UIImage(named:"attack3.png")!,
                        UIImage(named:"attack4.png")!
                        ]
    
    var bug = UIImage(named:"number1.png")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        character = Character()
        text = character!.text1
        let randInt = Int(arc4random_uniform(UInt32(text.count)))
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
        myhp = myhp - 100
        myHitPoint.text = String(myhp)
        myHpBar.setProgress(myHpBar.progress - 0.05, animated: true)
            }
            if(myhp <= 0){
                let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("GameOverViewController")
                
                next.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
                
                self.presentViewController(next, animated: true, completion: nil)
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
            HpBar.setProgress(Float(hp) * 0.01 - 0.05, animated: true)
            
            AttackEffect.animationImages = attackeffect
            AttackEffect.animationRepeatCount = 1
            AttackEffect.animationDuration = 0.3
            AttackEffect.startAnimating()
            

            if( hp <= 0){
                counter++
                
                if(counter == 2){
                    text = character!.text2
                }
                if(counter == 3){
                    text = character!.text3
                }
                if(counter == 4){
                    text = character!.text4
                }
                if(counter == 5){
                    text = character!.text5
                }
                
                if(counter == 6){
                    let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("ClearViewController")
                    
                    next.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
                    
                    self.presentViewController(next, animated: true, completion: nil)
                }
                
                hp = 100 + counter*10
                HpBar.setProgress(1.0 ,  animated: true)
                self.startTime2 = nil
                self.startTime2 = NSDate.timeIntervalSinceReferenceDate()
                
                switch counter{
                case 1:
                    Picture.image = monster2
                case 2:
                    Picture.image = monster3
                case 3:
                    Picture.image = monster4
                case 4:
                    Picture.image = monster5
                default:
                    Picture.image = bug
                }
                

            }
            
            Picture.animationImages = monster1damage
            Picture.animationRepeatCount = 3
            Picture.animationDuration = 0.2
            Picture.startAnimating()
            
            switch counter{
                
            case 1:
                    Picture.animationImages = monster2damage
                    Picture.animationRepeatCount = 3
                    Picture.animationDuration = 0.2
                    Picture.startAnimating()
            case 2:
                    Picture.animationImages = monster3damage
                    Picture.animationRepeatCount = 3
                    Picture.animationDuration = 0.2
                    Picture.startAnimating()
            case 3:
                    Picture.animationImages = monster4damage
                    Picture.animationRepeatCount = 3
                    Picture.animationDuration = 0.2
                    Picture.startAnimating()
            case 4:
                    Picture.animationImages = monster5damage
                    Picture.animationRepeatCount = 3
                    Picture.animationDuration = 0.2
                    Picture.startAnimating()
            default:
                    Picture.image = bug
            }
            
            let randInt2 = Int(arc4random_uniform(UInt32(text.count)))
            trueText.text = text[randInt2]
            Count.text = String(counter)
            HitPoint.text = String(hp)
        }
        self.textField.text=""
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func exitButtom(sender: AnyObject) {
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true,completion: nil)
    }
    
}
