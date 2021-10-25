//
//  PlayerViewClass.swift
//  Instagram Clone App
//
//  Created by apple on 24/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import  AVKit
import AVFoundation

class PlayerViewClass: UIView {
    override static var layerClass: AnyClass{
        
        return AVPlayerLayer.self
    }
    var playerLayer: AVPlayerLayer{
        
        return layer as! AVPlayerLayer
    }
    
    var player: AVPlayer?{
        
        get{
            return playerLayer.player
        }
        set{
            playerLayer.player = newValue
        }
    }
    
}
