//
//  FirstSectionTableViewCell.swift
//  Instagram Clone App
//
//  Created by apple on 13/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class FirstSectionTableViewCell: UITableViewCell, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var counter = 0
   // var arrHighlight = [InstaStory]()
    
    var userDetails: [UserDetails] = []
    
    // var instaStory = [InstaStory]()
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
        collectionViewOutlet.register(UINib(nibName: "FirstSectionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FirstSectionCollectionViewCell")
        
        collectionViewOutlet.register(UINib(nibName: "YourStoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "YourStoryCollectionViewCell")
        fetchUserData()
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
      private func fetchUserData() {
        let path = Bundle.main.path(forResource: "user-details", ofType: "json")
        let data = NSData(contentsOfFile: path ?? "") as Data?
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
            if let aUserDetails = json["userDetails"] as? [[String : Any]] {
                for element in aUserDetails {
                    userDetails += [UserDetails(userDetails: element)]
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        

    }
    


}

extension FirstSectionTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            
            let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "YourStoryCollectionViewCell", for: indexPath) as! YourStoryCollectionViewCell
            
            return cell
            
        }else{
            let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "FirstSectionCollectionViewCell", for: indexPath) as! FirstSectionCollectionViewCell
            
            
            cell.backgroundColor = .white
            
            cell.firstSectionImage.contentMode = .scaleAspectFill

            cell.firstSectionImage.imageFromServerURL(userDetails[indexPath.row].imageUrl)
            cell.firstSectionLabel.text = userDetails[indexPath.row].name
            
            
            
            
            return cell
            
        }
    }
}
extension FirstSectionTableViewCell: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        counter += 1
        print("countered: \(counter)")
        
        
        if indexPath.row == 0{
           // let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "YourStoryCollectionViewCell") 
          
            
            
        } else {
            
            DispatchQueue.main.async {
                let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContentView") as! ContentViewController
                vc.modalPresentationStyle = .overFullScreen
                vc.pages = self.userDetails
                vc.currentIndex = indexPath.row
                UIApplication.topViewController()?.navigationController!.present(vc, animated: true, completion: nil)
            }
            
            
        }
        
        
    }
    
}
extension FirstSectionTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
}



extension UIApplication
{
    
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?
    {
        if let nav = base as? UINavigationController
        {
            let top = topViewController(nav.visibleViewController)
            return top
        }
        
        if let tab = base as? UITabBarController
        {
            if let selected = tab.selectedViewController
            {
                let top = topViewController(selected)
                return top
            }
        }
        
        if let presented = base?.presentedViewController
        {
            let top = topViewController(presented)
            return top
        }
        return base
    }
}

