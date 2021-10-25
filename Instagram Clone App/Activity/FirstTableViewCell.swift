//
//  FirstTableViewCell.swift
//  Instagram Clone App
//
//  Created by apple on 24/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var image1: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        image1.layer.cornerRadius = image1.layer.frame.size.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
