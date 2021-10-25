//
//  ThirdTableViewCell.swift
//  Instagram Clone App
//
//  Created by apple on 24/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {

    @IBOutlet weak var image2: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        image2.layer.cornerRadius = image2.layer.frame.size.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
