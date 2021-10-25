//
//  ProfTableViewCell.swift
//  Instagram Clone App
//
//  Created by apple on 23/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ProfTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dpPic: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var postedImage: UIImageView!
    
    
    @IBOutlet weak var likeButton: UIButton!
    
    
    @IBOutlet weak var commentButton: UIButton!
    
    
    @IBOutlet weak var dmMessage: UIButton!
    

    @IBOutlet weak var saveButton: UIButton!
    
    
    @IBOutlet weak var likedbyLabel: UILabel!
    
    
    @IBOutlet weak var commentedLabel: UILabel!
    @IBOutlet weak var month: UILabel!
    
    
    @IBOutlet weak var viewCommentsButton: UIButton!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    override func
        awakeFromNib() {
          super.awakeFromNib()
        dpPic.layer.cornerRadius = dpPic.layer.frame.size.width/2
      }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    @IBAction func dmButtonTapped(_ sender: Any) {
        
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ChatsViewController") as! ChatsViewController
        
             UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)

    }
    
    
    
    @IBAction func commentsButtonTapped(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CommentsViewController") as! CommentsViewController
         //  vc.modalPresentationStyle = .overFullScreen
        //    vc.currentIndex = indexPath.row
           UIApplication.topViewController()?.navigationController!.show(vc, sender: self)
    }
    
    
    
}
