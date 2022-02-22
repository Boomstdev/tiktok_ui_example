//
//  PlayerView.swift
//  tiktok_ui
//
//  Created by BOICOMP21070028 on 21/2/2565 BE.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class PlayerViewClass : UIView{
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    var playerLayer: AVPlayerLayer {
        
        return layer as! AVPlayerLayer
    }
    
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        
        set {
            playerLayer.player = newValue
        }
    }
}
