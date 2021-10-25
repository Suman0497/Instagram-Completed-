//
//  PostTableViewCell.swift
//  Profile
//
//  Created by apple on 21/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var imageArr = [UIImage(named: "01"),
                    UIImage(named: "02"),
                    UIImage(named: "03"),
                    UIImage(named: "04"),
                    UIImage(named: "05"),
                    UIImage(named: "06"),
                    UIImage(named: "07"),
                    UIImage(named: "08")]
    
    let user = "Anti-Mage"
    @IBOutlet weak var profileSectionView: UIView!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    @IBOutlet weak var bookMarkBtn: UIButton!
    
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var likeLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    
    
    
    
    var swipeImages = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        usernameLbl.text = user
        
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        imageCollectionView.register(UINib(nibName: "ProfileSwipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileSwipeCollectionViewCell")
        pageControl.numberOfPages = imageArr.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = .systemBlue
        setupProfile()
        
        
    }
    
    
    func setupProfile(){
        profileImgView.layer.cornerRadius = profileImgView.layer.frame.size.width / 2
        profileImgView.layer.borderWidth = 0.5
        profileImgView.layer.borderColor = UIColor.systemGray3.cgColor
    }
}



extension PostTableViewCell:  UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileSwipeCollectionViewCell", for: indexPath) as! ProfileSwipeCollectionViewCell
        
        cell.swipeImages.image = imageArr[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
    
}

extension PostTableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 301)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
