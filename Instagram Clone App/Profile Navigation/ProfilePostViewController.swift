//
//  ProfilePostViewController.swift
//  Profile
//
//  Created by apple on 21/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ProfilePostViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var imageArr = [UIImage(named: "01"),
                    UIImage(named: "02"),
                    UIImage(named: "03"),
                    UIImage(named: "04"),
                    UIImage(named: "05"),
                    UIImage(named: "06"),
                    UIImage(named: "07"),
                    UIImage(named: "08")]
    
    
    var likedBy = ["Liked by Shanvi and 30 more", "Liked by Nisha and 12 more", "Liked by Shama and 40 more", "Liked by Shanvi and 25 more", "Liked by Samanvi and 10 more", "Liked by Bhuvan and 50 more", "Liked by Chandru and 19 more", "Liked by Sameeksha and 19 more"]
    
    var postedon = ["Posted 6 mins ago", "Posted 2h ago", "Posted 1day ago", "Posted 2days ago", "Posted 4days ago", "Posted 6days ago", "Posted a week ago", "Posted 10days ago"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        tableView.allowsSelection = false

    }
    


}
extension ProfilePostViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.profileImgView.image = UIImage(named: "01")
        cell.likeLbl.text = likedBy[indexPath.row]
        cell.timeLbl.text = postedon[indexPath.row]
        return cell
    }
    
    
    
    
    
}
