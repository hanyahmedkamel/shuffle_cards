//
//  soundmanager.swift
//  new sec
//
//  Created by HanyAhmed on 7/16/20.
//  Copyright © 2020 HanyAhmed. All rights reserved.
//

import Foundation
import AVFoundation
class soundmanager{
    var audioplayer:AVAudioPlayer?
    enum soundeffect {
        case isflip
        case ismatch
        case shufle
        case nomatch
    }
    func play(event:soundeffect ){
        var soundname=""
        switch event {
        case .isflip:
            soundname="cardflip"
        case.ismatch:
            soundname="dingcorrect "
        case .shufle:
            soundname="shuffle"
        case .nomatch:
            soundname="dingwrong"
        }
        let bundle:String?=Bundle.main.path(forResource: soundname, ofType: ".wav")
        if bundle==nil
         {
            return
        }
        let url=URL(fileURLWithPath: bundle!)
        do{
            audioplayer=try AVAudioPlayer(contentsOf: url)
            audioplayer?.play()
        }catch{
            print("couldn't help")
        }
        
    }
}
