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



//　2015/10/19 BGM,SE（仮）
//　　　適当にやった
//     後で書き直す
//     名前変えて入れて　攻撃時のSE：hit.mp3　BGM：bgm.mp3
//
//　訂正　通常戦闘：normal.mp3　ボス：boss.mp3



import UIKit
import AVFoundation

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
    @IBOutlet weak var Cutin: UIImageView!
    @IBOutlet weak var skillButton: UIButton!
    
    var test = 1
    var character:Character?
    internal var counter = 0 //今いる階層を表す変数
    var hp = 100 //敵のhpを表す変数 
    var text:[String]=[]
    var startTime: NSTimeInterval? = nil
    var timer: NSTimer?
    var startTime2: NSTimeInterval? = nil 
    var timer2: NSTimer?
    var ctintmr:NSTimer? //カットインに使われるタイマー
    var skiitmr:NSTimer? //スキル中に使われるタイマー
    var player = AVAudioPlayer()
    var bgmplayer = AVAudioPlayer()
    var attachment = 0 //敵の攻撃力を階層ごとに強くする変数
    var uphp = 0  //階層ごとに敵のhpをあげるための変数
    var damage:Double = 5
    var se_attack1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("hit", ofType: "mp3")!)
    var bgm = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("normal", ofType: "mp3")!)
    
  //  var bossbgm = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("boss", ofType: "mp3")!)
    
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
    
    var stairs = [
        UIImage(named:"一拍1.png")!,
        UIImage(named:"一拍2.png")!,
        UIImage(named:"一拍3.png")!,
        UIImage(named:"一拍4.png")!,
        UIImage(named:"一拍5.png")!,
        UIImage(named:"一拍6.png")!,
        UIImage(named:"一拍7.png")!,
        UIImage(named:"一拍8.png")!,
                  ]
    
    
    var bug = UIImage(named:"number1.png")
    var comma = UIImage(named:"cutin2.png")
    
    
 
    
    //自分の装備の攻撃力やレベルによるステータスをみるための変数
    let defaults = NSUserDefaults.standardUserDefaults()
    var EquipmentData:equipmentData?
    var attackData:Int = 0
    var protectData:Int = 0
    var myhp:Double = 0.0
    var attackStates:Double = 0
    var defStates:Double = 0
    var spd:Double = 0.0
    var attack:Double = 0
    var def:Double = 0
    var equipmentSkill:Int = 0
    var hphold:Int = 0// 敵の最大hpを保持させる
    var myhphold:Int = 0 //自分の最大hpを保持させる
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EquipmentData = equipmentData()
        let equipmentWeapon:Int = defaults.integerForKey("equipmentWeapon")
        let equipmentProtect:Int = defaults.integerForKey("equipmentProtect")
        attackData = EquipmentData!.weaponsData(equipmentWeapon)
        protectData = EquipmentData!.protectData(equipmentProtect)
        myhp = Double(defaults.integerForKey("hp"))
        attackStates = Double(defaults.integerForKey("attack"))
        spd = Double(defaults.integerForKey("spd"))
        defStates = Double(defaults.integerForKey("def"))
        var attackInterval:Double = 1.0 //攻撃間隔の基準値
        attackInterval += spd/1000
        
        attack = Double(attackData) + attackStates
        def = Double(protectData) + defStates
        self.textField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        character = Character()
        text = character!.text1
        let randInt = Int(arc4random_uniform(UInt32(text.count)))
        trueText.text = text[randInt]
        Count.text = String(counter)
        HitPoint.text = String(hp)
        let myHpWrite = Int(myhp)
        myHitPoint.text = String(myHpWrite)
         self.startTime = NSDate.timeIntervalSinceReferenceDate()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        self.startTime2 = NSDate.timeIntervalSinceReferenceDate()
        self.timer2 = NSTimer.scheduledTimerWithTimeInterval(attackInterval, target: self, selector: Selector("attacked"), userInfo: nil, repeats: true)
        
        HpBar.progress = 1.0
        myHpBar.progress = 1.0
        Picture.image = monster1
        hphold = hp
        myhphold = Int(myhp)
        
        player = try! AVAudioPlayer(contentsOfURL: se_attack1) 
        player.prepareToPlay()
        bgmplayer = try! AVAudioPlayer(contentsOfURL: bgm)
        bgmplayer.numberOfLoops = -1
        bgmplayer.prepareToPlay()
        bgmplayer.play()
        
        textField.autocorrectionType = UITextAutocorrectionType.No

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 敵から攻撃を受ける時の関数
    func attacked() {
        
            if let t = self.startTime2{
                let time: Double = NSDate.timeIntervalSinceReferenceDate() - t
                let sec: Int = Int(time)
                if(sec%5 == 0){
                    myhp = myhp - (damage-def/100)
                    let myHpWrite = Int(myhp)
                    myHitPoint.text = String(myHpWrite)
                    let gageMyHp:Float = Float(myhp)/Float(myhphold)
                    myHpBar.setProgress(gageMyHp, animated: true)
                }
                if(myhp <= 0){
                    bgmplayer.stop()
                    let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                    let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("GameOverViewController")
                
                    next.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
                    let t = self.startTime
                    let app:AppDelegate =
                    (UIApplication.sharedApplication().delegate as! AppDelegate)
                    app.timeCount = NSDate.timeIntervalSinceReferenceDate() - t!
                    app.hierarchy = counter
                    self.presentViewController(next, animated: true, completion: nil)
                }
            }
        
    }
    
    //タイマーの時間を管理する関数
    func update() {
        if let t = self.startTime {
            let time: Double = NSDate.timeIntervalSinceReferenceDate() - t
            let sec: Int = Int(time)
            let msec: Int = Int((time - Double(sec)) * 100.0)
             self.timerLabel.text = String(format: "%02d:%02d:%02d", sec/60, sec%60, msec)
        
        }
    }
    
    //文字を打ち終えた時に管理する関数
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if(textField.text==trueText.text){
            
            hp = Int(hp - Int(attack))
            var gageHp:Float = Float(hp)
            gageHp = gageHp/Float(hphold)
            HpBar.setProgress(gageHp, animated: true)
            
            
            AttackEffect.animationImages = attackeffect
            AttackEffect.animationRepeatCount = 1
            AttackEffect.animationDuration = 0.3
            AttackEffect.startAnimating()
            
           // player.play()


            if( hp <= 0){
                
                AttackEffect.animationImages = stairs
                AttackEffect.animationDuration = 0.6
                AttackEffect.startAnimating()
                
                counter++
                
                if(counter == 1){ //第２階層に入る時の処理
                    text = character!.text2
                    uphp = 10
                }
                if(counter == 2){ //第３階層に入る時の処理
                    text = character!.text3
                    uphp = 20
                    damage = 6
                }
                if(counter == 3){ //第４階層に入る時の処理
                    text = character!.text4
                    uphp = 50
                    damage = 10
                }
                if(counter == 4){ //第５階層に入る時の処理
                    text = character!.text5
                    uphp = 100
                    damage = 20
                    
         //           bgmplayer = try!AVAudioPlayer(contentsOfURL: bossbgm)
                    bgmplayer.prepareToPlay()
                    bgmplayer.play()
                }
                
                if(counter == 5){ //すべての敵を倒した時に画面推移させる
                    bgmplayer.stop()
                    let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("ClearViewController")
                    
                    next.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
                    
                    let t = self.startTime
                    let app:AppDelegate =
                    (UIApplication.sharedApplication().delegate as! AppDelegate)
                    app.timeCount = NSDate.timeIntervalSinceReferenceDate() - t!
                    app.hierarchy = counter
                    self.presentViewController(next, animated: true, completion: nil)
            
                }
                
                hp = 100 + uphp
                hphold = hp
                
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
        // textField.resignFirstResponder()
        return false
    }
    
    
    @IBAction func exitButtom(sender: AnyObject) {
        bgmplayer.stop()
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true,completion: nil)
    }
    
    
    //スキルアクションをしたときの動作
    @IBAction func SkillAction(sender: AnyObject) {
        skillButton.enabled = false
        let equipmentSkill = defaults.integerForKey("equipmentSkill")
        Cutin.image = comma
        ctintmr = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "cutin", userInfo: nil, repeats: false)
        
        
        switch equipmentSkill{
        case 0: //体力回復
            if( (myhphold - Int(myhp)) < 50){
                myhp = Double(myhphold)
                myHpBar.setProgress(1.0, animated: true)
            }else{
                myhp += 50
                let myHpWrite:Float = Float(myhp)/Float(myhphold)
                myHpBar.setProgress(myHpWrite, animated: true)
            }
        case 1:
                hp = hp - 50
                var gageHp:Float = Float(hp)
                gageHp = gageHp/Float(hphold)
                HpBar.setProgress(gageHp, animated: true)
                
                
                AttackEffect.animationImages = attackeffect
                AttackEffect.animationRepeatCount = 1
                AttackEffect.animationDuration = 0.3
                AttackEffect.startAnimating()
                
                // player.play()
                
                
                if( hp <= 0){
                    
                    AttackEffect.animationImages = stairs
                    AttackEffect.animationDuration = 0.6
                    AttackEffect.startAnimating()
                    
                    counter++
                    
                    if(counter == 1){ //第２階層に入る時の処理
                        text = character!.text2
                        uphp = 10
                    }
                    if(counter == 2){ //第３階層に入る時の処理
                        text = character!.text3
                        uphp = 20
                        damage = 6
                    }
                    if(counter == 3){ //第４階層に入る時の処理
                        text = character!.text4
                        uphp = 50
                        damage = 10
                    }
                    if(counter == 4){ //第５階層に入る時の処理
                        text = character!.text5
                        uphp = 100
                        damage = 20
                    }
                    
                    if(counter == 5){ //すべての敵を倒した時に画面推移させる
                        bgmplayer.stop()
                        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("ClearViewController")
                        
                        next.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
                        let t = self.startTime
                        let app:AppDelegate =
                        (UIApplication.sharedApplication().delegate as! AppDelegate)
                        app.timeCount = NSDate.timeIntervalSinceReferenceDate() - t!
                        app.hierarchy = counter
                        self.presentViewController(next, animated: true, completion: nil)
                    }
                    
                    hp = 100 + uphp
                    hphold = hp
                    
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
        
        self.textField.text=""
    //    textField.resignFirstResponder()
        
       
            case 2: //文章を簡単にする
            text = character!.text6
            let randInt2 = Int(arc4random_uniform(UInt32(text.count)))
            trueText.text = text[randInt2]
                
       
            case 3: //攻撃力をあげるスキル
            attack = attack*2
            skiitmr = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "attackcut", userInfo: nil, repeats: false)
            
         
            case 4: //自分もダメージを食らうが相手にも大ダメージを与えるスキル
                if( myhp > 30){
            myhp = myhp - 30
            let myHpWrite = Int(myhp)
            myHitPoint.text = String(myHpWrite)
            let gageMyHp:Float = Float(myhp)/Float(myhphold)
            myHpBar.setProgress(gageMyHp, animated: true)
                }else if(myhp <= 30){
                    myhp = 1.0
                    let myHpWrite = Int(myhp)
                    myHitPoint.text = String(myHpWrite)
                    let gageMyHp:Float = Float(myhp)/Float(myhphold)
                    myHpBar.setProgress(gageMyHp, animated: true)
            }
                hp = hp - 100
                var gageHp:Float = Float(hp)
                gageHp = gageHp/Float(hphold)
                HpBar.setProgress(gageHp, animated: true)
                
                
                AttackEffect.animationImages = attackeffect
                AttackEffect.animationRepeatCount = 1
                AttackEffect.animationDuration = 0.3
                AttackEffect.startAnimating()
                
                // player.play()
                
                
                if( hp <= 0){
                    
                    AttackEffect.animationImages = stairs
                    AttackEffect.animationDuration = 0.6
                    AttackEffect.startAnimating()
                    
                    counter++
                    
                    if(counter == 1){ //第２階層に入る時の処理
                        text = character!.text2
                        uphp = 10
                    }
                    if(counter == 2){ //第３階層に入る時の処理
                        text = character!.text3
                        uphp = 20
                        damage = 6
                    }
                    if(counter == 3){ //第４階層に入る時の処理
                        text = character!.text4
                        uphp = 50
                        damage = 10
                    }
                    if(counter == 4){ //第５階層に入る時の処理
                        text = character!.text5
                        uphp = 100
                        damage = 20
                    }
                    
                    if(counter == 5){ //すべての敵を倒した時に画面推移させる
                        bgmplayer.stop()
                        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("ClearViewController")
                        
                        let t = self.startTime
                        let app:AppDelegate =
                        (UIApplication.sharedApplication().delegate as! AppDelegate)
                        app.timeCount = NSDate.timeIntervalSinceReferenceDate() - t!

                        next.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
                        app.hierarchy = counter
                        self.presentViewController(next, animated: true, completion: nil)
                    }
                    
                    hp = 100 + uphp
                    hphold = hp
                    
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
                
                self.textField.text=""
             //   textField.resignFirstResponder()
            
                default:
                break
            }

            
        }
    
    func attackcut(){
        attack = attack/2
        
    }
    
        
        
    
    func cutin(){
        Cutin.removeFromSuperview()
        ctintmr?.invalidate()
        }
    
}
