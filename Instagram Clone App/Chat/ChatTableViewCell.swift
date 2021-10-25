//
//  ChatTableViewCell.swift
//  Instagram Clone App
//
//  Created by apple on 24/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var messagelbl: UILabel!
    
    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var namelbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        images.layer.cornerRadius = images.layer.frame.size.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
