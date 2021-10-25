//
//  TappedOnProfileViewController.swift
//  Instagram Clone App
//
//  Created by apple on 23/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class TappedOnProfileViewController: UIViewController {
    
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
    
    var likedBy = ["Liked by Shanvi and 30 more", "Liked by Nisha and 12 more", "Liked by Shama and 40 more", "Liked by Shanvi and 25 more", "Liked by Samanvi and 10 more", "Liked by Bhuvan and 50 more", "Liked by Chandru and 19 more", "Liked by Sameeksha and 19 more", "Liked by Fathima, shanvi and 35more", "Liked by Bharath and 40 more","Liked by Shanvi and 30 more", "Liked by Nisha and 12 more", "Liked by Shama and 40 more", "Liked by Shanvi and 25 more", "Liked by Samanvi and 10 more", "Liked by Bhuvan and 50 more", "Liked by Chandru and 19 more", "Liked by Sameeksha and 19 more", "Liked by Fathima, shanvi and 35more", "Liked by Bharath and 40 more"]
    
    var postedon = ["Posted 6 mins ago", "Posted 2h ago", "Posted 1day ago", "Posted 2days ago", "Posted 4days ago", "Posted 6days ago", "Posted a week ago", "Posted 10days ago", "Posted 12days ago", "Posted mon ago", "Posted 6 mins ago", "Posted 2h ago", "Posted 1day ago", "Posted 2days ago", "Posted 4days ago", "Posted 6days ago", "Posted a week ago", "Posted 10days ago", "Posted 12days ago", "Posted mon ago"]
    
    @IBOutlet weak var tableViewOut: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOut.dataSource = self
        tableViewOut.delegate = self
        tableViewOut.register(UINib(nibName: "ProfTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfTableViewCell")
        tableViewOut.allowsSelection = false

    }
    


}
extension TappedOnProfileViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOut.dequeueReusableCell(withIdentifier: "ProfTableViewCell", for: indexPath) as! ProfTableViewCell
        cell.dpPic.image = UIImage(named: "001")
        cell.postedImage.image = arr2[indexPath.row]
        cell.name.text = "Suman Jamal"
        cell.likedbyLabel.text = likedBy[indexPath.row]
        cell.month.text = postedon[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 527
    }
    
    
}
