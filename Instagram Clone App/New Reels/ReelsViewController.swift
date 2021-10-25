//
//  ReelsViewController.swift
//  Instagram Clone App
//
//  Created by apple on 24/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ReelsViewController: UIViewController {
    
    
    @IBOutlet weak var table: UITableView!
    
    var videoUrls = ["https://www.statusgreet.in/uploads/video/2020/04/tujhe-tak-tak-takte-rehna-cute-girl-tik-tok-whatsapp-status-video.mp4", "https://www.statusgreet.in/uploads/video/2019/11/cute-baby-beautiful-tik-tok-whatsapp-status-video.mp4",
                     "https://beststatuss.com/wp-content/uploads/2021/07/yt1s.com-Vaaste-song-Female-version-Cute-Barbie-doll-whatsapp-status-Full-screen-HD-whatsapp-status_v720P.mp4",
                     "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4","http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4", "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4","http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4"]
    
    var disk = ["one", "two", "three", "four", "five", "six", "seven", "001"]
    var arr2 = [UIImage(named: "001"),
                UIImage(named: "002"),
                UIImage(named: "003"),
                UIImage(named: "004"),
                UIImage(named: "005"),
                UIImage(named: "006"),
    UIImage(named: "007"),
    UIImage(named: "008")]
    var names = ["Anti-Mage", "Axe","Morphling", "BloodSeeker", "Shyama", "Sam","Nisha", "Suman"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "ReelsTableViewCell", bundle: nil), forCellReuseIdentifier: "ReelsTableViewCell")
        
    }
    
    
    
}
extension ReelsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoUrls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReelsTableViewCell", for: indexPath) as! ReelsTableViewCell
        
        UIView.animate(withDuration: 12.0, delay: 1, options: ([.curveLinear, .repeat]), animations: {() -> Void in
            cell.scrollingSongname.center = CGPoint.init(x: 35 - cell.scrollingSongname.bounds.size.width / 2, y: cell.scrollingSongname.center.y)
        }, completion:  { _ in })
        
        cell.diskPick.image = UIImage(named: disk[indexPath.row])
        cell.dp.image = arr2[indexPath.row]
        cell.username.text = names[indexPath.row]
        
        let videoUrl = NSURL(string: videoUrls[indexPath.row])
        let avPlayer = AVPlayer(url: videoUrl! as URL)
        cell.playerView?.playerLayer.player = avPlayer
        cell.playerView.frame = view.bounds
        cell.playerView.player?.externalPlaybackVideoGravity = .resizeAspectFill
        cell.playerView.player?.play()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height
    }
    
    
}
