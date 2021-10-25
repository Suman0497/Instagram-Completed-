//
//  HighLightsCollectionViewCell.swift
//  Instagram Clone App
//
//  Created by apple on 23/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class HighLightsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var highlightImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        highlightImage.layer.cornerRadius = highlightImage.layer.frame.size.width/2
        highlightImage.contentMode = .scaleToFill
    }

}
