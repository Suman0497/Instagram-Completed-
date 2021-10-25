//
//  ProfileViewController.swift
//  Instagram Clone App
//
//  Created by apple on 22/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let inset: CGFloat = 0
    let minimumLineSpacing: CGFloat = 0
    let minimumInteritemSpacing: CGFloat = 0
    var cellsPerRow = 3
    var imageArr = [UIImage(named: "01"),
                    UIImage(named: "02"),
                    UIImage(named: "03"),
                    UIImage(named: "04"),
                    UIImage(named: "05"),
                    UIImage(named: "06"),
                    UIImage(named: "07"),
                    UIImage(named: "08"),
                    UIImage(named: "02"),
                    UIImage(named: "03"),
                    UIImage(named: "04"),
                    UIImage(named: "05"),
                    UIImage(named: "06"),
                    UIImage(named: "07"),
                    UIImage(named: "08")]
    
    
    @IBOutlet weak var clview: UICollectionView!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var postNumBtn: UIButton!
    @IBOutlet weak var followerBtn: UIButton!
    @IBOutlet weak var followingBtn: UIButton!
    @IBOutlet weak var profileDescriptionLbl: UILabel!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var messageBtn: UIButton!
    @IBOutlet weak var suggestionBtn: UIButton!
    
    
    @IBAction func followButtonTapped(_ sender: Any) {
        followerBtn.setTitle("121", for: .normal)
        followBtn.backgroundColor = .gray
        followBtn.setTitle("Following", for: .normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clview.dataSource = self
        clview.delegate = self
        clview.register(UINib(nibName: "PostImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PostImageCollectionViewCell")
        clview.contentInsetAdjustmentBehavior = .always
        
        profileImgView.image = UIImage(named: "01")
        postNumBtn.titleLabel?.text = "23"
        followerBtn.titleLabel?.text = "109"
        followingBtn.titleLabel?.text = "300"
        profileDescriptionLbl.text = "Anti-Mage"
        profileImgView.layer.cornerRadius = profileImgView.layer.frame.size.width / 2
        
        
        
        
    }
    
    
    
}
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostImageCollectionViewCell", for: indexPath) as! PostImageCollectionViewCell
        cell.postedImage.image = imageArr[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        DispatchQueue.main.async {
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfilePostViewController") as! ProfilePostViewController
         
            UIApplication.topViewController()?.navigationController!.show(vc, sender: self)
        }
        
        
    }
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let marginsAndInsets = inset * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        clview.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    
}

