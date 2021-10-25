//
//  YourStoryCollectionViewCell.swift
//  Instagram Clone App
//
//  Created by apple on 14/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import BSImagePicker
import Photos


class YourStoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var swiftImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        swiftImage.layer.cornerRadius = swiftImage.frame.width / 2     }
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let imagePicker = ImagePickerController()
        imagePicker.settings.selection.max = 5
        imagePicker.settings.theme.selectionStyle = .numbered
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image, .video]
        imagePicker.settings.selection.unselectOnReachingMax = true

        let start = Date()
        UIApplication.topViewController()?.navigationController!.presentImagePicker(imagePicker, select: { (asset) in
            print("Selected: \(asset)")
        }, deselect: { (asset) in
            print("Deselected: \(asset)")
        }, cancel: { (assets) in
            print("Canceled with selections: \(assets)")
        }, finish: { (assets) in
            print("Finished with selections: \(assets)")
        }, completion: {
            let finish = Date()
            print(finish.timeIntervalSince(start))
        })
    }
    
    
    
    
}
