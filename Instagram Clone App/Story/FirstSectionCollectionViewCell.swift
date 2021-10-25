//
//  FirstSectionCollectionViewCell.swift
//  Instagram Clone App
//
//  Created by apple on 13/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class FirstSectionCollectionViewCell: UICollectionViewCell {

  
    @IBOutlet weak var firstSectionImage: UIImageView!
    
    
    @IBOutlet weak var firstSectionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        firstSectionImage.layer.cornerRadius = firstSectionImage.frame.width / 2 
        firstSectionImage.layer.borderWidth = 3
        firstSectionImage.layer.borderColor = CGColor.init(srgbRed: 1, green: 0, blue: 0, alpha: 1)
    }
    
    

}
