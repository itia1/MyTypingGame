//
//  File.swift
//  DevilHouse
//
//  Created by あああああああああああああああああああ on 2015/10/19.
//  Copyright © 2015年 Itia. All rights reserved.
//

import Foundation
import AVFoundation



class SE:NSObject {
    var player:AVAudioPlayer?
    func SEPlay(soundname: String){
        player?.prepareToPlay()
        player?.play()
    }
}