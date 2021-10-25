//
//  NewProfileViewController.swift
//  Instagram Clone App
//
//  Created by apple on 23/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class NewProfileViewController: UIViewController {
    
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    var imageArr = [UIImage(named: "01"),
                    UIImage(named: "02"),
                    UIImage(named: "03"),
                    UIImage(named: "04"),
                    UIImage(named: "05"),
                    UIImage(named: "06"),
                    UIImage(named: "07"),
                    UIImage(named: "08")]
    var arr2 = [UIImage(named: "001"),
                UIImage(named: "002"),
                UIImage(named: "003"),
                UIImage(named: "004"),
                UIImage(named: "005"),
                UIImage(named: "006"),
                UIImage(named: "007"),
                UIImage(named: "008"),
                UIImage(named: "009"),
                UIImage(named: "010"),
                UIImage(named: "011"),
                UIImage(named: "012"),
                UIImage(named: "013"),
                UIImage(named: "014"),
                UIImage(named: "015"),
                UIImage(named: "016"),
                UIImage(named: "017"),
                UIImage(named: "018"),
                UIImage(named: "019"),
                UIImage(named: "020")
    ]
    
    
    @IBOutlet weak var highlightsCollectionView: UICollectionView!
    
    
    @IBOutlet weak var postsCollectionview: UICollectionView!
    
    
    @IBOutlet weak var dpImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        highlightsCollectionView.dataSource = self
        highlightsCollectionView.delegate = self
        postsCollectionview.dataSource = self
        postsCollectionview.delegate = self
        highlightsCollectionView.register(UINib(nibName: "HighLightsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HighLightsCollectionViewCell")
        
        postsCollectionview.register(UINib(nibName: "PostsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PostsCollectionViewCell")
        
        postsCollectionview.register(UINib(nibName: "SegmenttwoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SegmenttwoCollectionViewCell")
        
        dpImage.layer.cornerRadius = dpImage.layer.frame.size.width/2
        dpImage.layer.borderWidth = 2
        dpImage.layer.borderColor = .init(srgbRed: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        segmentedOutlet.addUnderlineForSelectedSegment()
        
        
    }
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        segmentedOutlet.changeUnderlinePosition()
        
        if segmentedOutlet.selectedSegmentIndex == 0{
            print("selected 0 index")
            
        }else{
            //             let sb = UIStoryboard.init(name: "Main", bundle: nil)
            //             let vc = sb.instantiateViewController(identifier: "SecondVC")
            //             self.navigationController?.pushViewController(vc, animated: true)
            // segmentOut.selectedSegmentIndex = 0
            
        }
    }
    
    
    
}

extension NewProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == postsCollectionview){
            return arr2.count
        }
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if (collectionView == postsCollectionview){
            let cell1 = postsCollectionview.dequeueReusableCell(withReuseIdentifier: "PostsCollectionViewCell", for: indexPath) as! PostsCollectionViewCell
            cell1.postedImage.image = arr2[indexPath.row]
            cell1.postedImage.contentMode = .scaleAspectFill
            return cell1
            
        }
        
    
        
        let cell = highlightsCollectionView.dequeueReusableCell(withReuseIdentifier: "HighLightsCollectionViewCell", for: indexPath) as! HighLightsCollectionViewCell
        cell.highlightImage.image = imageArr[indexPath.row]
        cell.nameLabel.text = "Donuts"
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == postsCollectionview){
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TappedOnProfileViewController") as! TappedOnProfileViewController
                    //  vc.modalPresentationStyle = .overFullScreen
                   //    vc.currentIndex = indexPath.row
                      UIApplication.topViewController()?.navigationController!.show(vc, sender: self)
            
        }else{
            
            
        }
        }
        
        
    }
    
    extension NewProfileViewController: UICollectionViewDelegateFlowLayout{
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            if collectionView == postsCollectionview{
                
                
                return CGSize(width: postsCollectionview.frame.size.width/2, height: postsCollectionview.frame.size.width/2)
                
            }
            return CGSize(width: 70, height: 500)
        }
        
        
        
        
}

