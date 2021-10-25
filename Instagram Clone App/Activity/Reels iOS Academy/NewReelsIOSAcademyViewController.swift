//
//  NewReelsIOSAcademyViewController.swift
//  Instagram Clone App
//
//  Created by apple on 24/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

struct VideoModel {
    let caption:String
    let username: String
    let audioTractName:String
    let videoFileName:String
    let videoFileFormat: String
}



class NewReelsIOSAcademyViewController: UIViewController {

    
    
    private var collectionview: UICollectionView?
    private var data = [VideoModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10{
            let model = VideoModel(caption: "This is so cute", username: "Sharan", audioTractName: "Cute animated video", videoFileName: "2", videoFileFormat: "mp4")
            data.append(model)
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview?.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
        collectionview?.isPagingEnabled = true
        collectionview?.dataSource = self
        view.addSubview(collectionview!)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionview?.frame = view.bounds
    }

}
extension NewReelsIOSAcademyViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = data[indexPath.row]
        let cell = collectionview?.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath) as! VideoCollectionViewCell
        cell.configure(with: model)
        cell.delegate = self
        return cell
     }
    
    
}
extension NewReelsIOSAcademyViewController: VideoCollectionViewCellDelegate{
    
    func didTapLikeButton(with model: VideoModel) {
        print("Like button tapped")
    }
    
    func didTapProfileButton(with model: VideoModel) {
        print("Profile button tapped")
    }
    
    func didTapShareButton(with model: VideoModel) {
        print("share button tapped")
    }
    
    func didTapCommentButton(with model: VideoModel) {
        print("Comment button tapped")
    }
    
    
    
}
