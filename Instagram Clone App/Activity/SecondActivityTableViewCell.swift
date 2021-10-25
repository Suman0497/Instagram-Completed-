//
//  SecondActivityTableViewCell.swift
//  Instagram Clone App
//
//  Created by apple on 25/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SecondActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var image3: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        image3.layer.cornerRadius = image3.layer.frame.size.width/2
        btn.layer.cornerRadius = 7
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
