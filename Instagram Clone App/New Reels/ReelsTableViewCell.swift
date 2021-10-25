//
//  ReelsTableViewCell.swift
//  Instagram Clone App
//
//  Created by apple on 24/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import AVFoundation

class ReelsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scrollingSongname: UILabel!
    
    @IBOutlet weak var reelName: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var playerView: PlayerViewClass!
    
    
    @IBOutlet weak var diskPick: UIImageView!
    
    @IBOutlet weak var dp: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        diskPick.layer.cornerRadius = diskPick.layer.frame.size.width/2
        dp.layer.cornerRadius = dp.layer.frame.size.width/2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
