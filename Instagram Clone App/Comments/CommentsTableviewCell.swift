//
//  CommentsTableviewCell.swift
//  Instagram Clone App
//
//  Created by apple on 23/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class CommentsTableviewCell: UITableViewCell {
    
    @IBOutlet weak var coment: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var dp: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var likes: UILabel!
    
    @IBOutlet weak var days: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dp.layer.cornerRadius = dp.layer.frame.size.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func replyButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func likebuttonTapped(_ sender: Any) {
    }
}
