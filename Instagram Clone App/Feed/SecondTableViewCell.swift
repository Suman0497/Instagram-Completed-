//
//  SecondTableViewCell.swift
//  Instagram Clone App
//
//  Created by apple on 13/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate
{

    var instaList = [InstaModel]()
    
    var imageArr = [UIImage(named: "01"),
                    UIImage(named: "02"),
                    UIImage(named: "03"),
                    UIImage(named: "04"),
                    UIImage(named: "05"),
                    UIImage(named: "06"),
                    UIImage(named: "07"),
                    UIImage(named: "08")]
    var arr2 = [UIImage(named: "001"),
    UIImage(named: "002")]
    


    
    
    @IBOutlet weak var profileSectionView1: UIView!
    @IBOutlet weak var usernameLbl1: UILabel!
    @IBOutlet weak var moreBtn1: UIButton!
    
    
    @IBOutlet weak var likeBtn1: UIButton!
    @IBOutlet weak var commentBtn1: UIButton!
    @IBOutlet weak var shareBtn1: UIButton!
    @IBOutlet weak var pageView1: UIPageControl!
    
    
    
    @IBOutlet weak var bookMarkBtn1: UIButton!
    
    @IBOutlet weak var likeView1: UIView!
    @IBOutlet weak var likeLbl1: UILabel!
    @IBOutlet weak var captionLbl1: UILabel!
    @IBOutlet weak var commentLbl1: UILabel!
    @IBOutlet weak var timeLbl1: UILabel!
    
    @IBOutlet weak var swipeImagesCollection1: UICollectionView!
    @IBOutlet weak var displayPicture1: UIImageView!
    
    
    @IBAction func dpButtonTapped(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
    
         UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    var counter = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeBtn1.tintColor = .black
        swipeImagesCollection1.dataSource = self
        swipeImagesCollection1.delegate = self
        swipeImagesCollection1.register(UINib(nibName: "PostedImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PostedImageCollectionViewCell")
        
        displayPicture1.layer.cornerRadius = displayPicture1.layer.frame.size.width / 2

        pageView1.numberOfPages = imageArr.count
        pageView1.currentPage = 0
        pageView1.pageIndicatorTintColor = .systemGray
        pageView1.currentPageIndicatorTintColor = .systemBlue
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     
    }
    
 
    @IBAction func likeButton(_ sender: Any) {
        
        counter += 1
               likeLbl1.text = "\(23 + counter) Likes"
               likeBtn1.tintColor = .red
    }
    
    
    
    @IBAction func commentButtonTapped(_ sender: Any) {
        
        
    }

    
    @IBAction func dmBarButtonTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
              let secondVC = storyBoard.instantiateViewController(withIdentifier: "ChatsViewController")
              UIApplication.topViewController()?.navigationController?.pushViewController(secondVC, animated: true)
        
        
    }
    
    
  
    @IBAction func saveBarButton(_ sender: Any) {
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = swipeImagesCollection1.dequeueReusableCell(withReuseIdentifier: "PostedImageCollectionViewCell", for: indexPath) as! PostedImageCollectionViewCell
       
            cell.imagePosted.image = imageArr[indexPath.row]
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageView1.currentPage = indexPath.row
    }
    
}

extension SecondTableViewCell : UICollectionViewDelegateFlowLayout {
    
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
