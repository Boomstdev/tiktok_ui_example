//
//  CollectionPlayerViewCell.swift
//  tiktok_ui
//
//  Created by BOICOMP21070028 on 17/2/2565 BE.
//

import UIKit
import AVKit

class CollectionPlayerViewCell: UICollectionViewCell {
    
    static let indentify = "collectionCell"
    
    var player: AVPlayer?
    var playerViewController = AVPlayerViewController()
    
    var videoName: String?
    
    @IBOutlet weak var viewPlayer: PlayerViewClass!
    

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var totalLike: UILabel!
    @IBOutlet weak var totalComment: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var originalSong: UILabel!
    var isLike:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if isLike{
            DispatchQueue.main.async {
                self.btnLike.imageView!.tintColor = .red
            }
        }else{
            DispatchQueue.main.async {
                self.btnLike.imageView!.tintColor = .white
            }
        }
        
    }
    
    @IBAction func btnLike(_ sender: Any) {
        self.isLike = !self.isLike
        if isLike{
            DispatchQueue.main.async {
                self.btnLike.imageView!.tintColor = .red
            }
        }else{
            DispatchQueue.main.async {
                self.btnLike.imageView!.tintColor = .white
            }
        }
    }
    @IBAction func btnComment(_ sender: Any) {
    }
    @IBAction func btnShare(_ sender: Any) {
    }
    
    func config(videoItem: VideoModel?){
        if videoItem?.profileImage != nil {
            profileImage.image = UIImage(named: (videoItem?.profileImage)!)
            videoImage.image = UIImage(named: (videoItem?.profileImage)!)
            profileImage.connerCircle(borderWidth: 0)
            videoImage.connerCircle(borderWidth: 0)
        }
        if let total = videoItem?.totalLike {
            totalLike.text = String(total)
        }
        if let total = videoItem?.totalComment {
            totalComment.text = String(total)
        }
        if let str = videoItem?.profileName {
            profileName.text = str
        }
        if let str = videoItem?.content {
            content.text = str
        }
        if let str = videoItem?.music {
            originalSong.text =  str
            UIView.animate(withDuration: 10.0, delay: 1, options: ([.curveLinear, .repeat]), animations: {() -> Void in
                       self.originalSong.center = CGPoint(x:  self.originalSong.bounds.size.width/5, y: self.originalSong.center.y)

                   }, completion:  nil)
        }
        if let like = videoItem?.isLike {
            isLike = like
        }
       
    }
    
    func playVideoWithFile(videoName: String){
        guard let filePath = Bundle.main.path(forResource: videoName, ofType: "mp4")else{ return }
        player = AVPlayer(url: URL(fileURLWithPath: filePath))
        self.videoName = videoName
        self.viewPlayer.playerLayer.player = player
        self.viewPlayer.playerLayer.videoGravity = .resizeAspectFill
        self.viewPlayer.player?.volume = 0
        
        self.viewPlayer.player?.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player?.currentItem)
    }
    
    @objc
    func playerItemDidReachEnd(notification: Notification) {
        self.viewPlayer.playerLayer.player?.seek(to: CMTime.zero)
    }
    
    func playVideo(){
        self.viewPlayer.player?.play()
    }
    func pauseVideo(){
        self.viewPlayer.player?.pause()
    }
}
