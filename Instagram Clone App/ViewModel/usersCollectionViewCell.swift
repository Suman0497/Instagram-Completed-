//
//  usersCollectionViewCell.swift
//  ARStories
//
//  Created by apple on 17/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class usersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lblUserName.textAlignment = .center
        self.imgView.layer.cornerRadius = self.imgView.frame.size.height / 2;
        self.imgView.layer.borderColor = UIColor.red.cgColor
        self.imgView.layer.borderWidth = 3
        self.imgView.clipsToBounds = true
    }
}
