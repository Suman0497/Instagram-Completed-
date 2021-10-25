//
//  CommentsViewController.swift
//  Instagram Clone App
//
//  Created by apple on 23/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
    
    var pods = ["Awesome Pods", "Thank you"]
    var names = ["Shyam", "Suman"]
    var days = ["2d", "1h"]
    var likes = ["2likes", "2likes"]
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        tableViewOutlet.register(UINib(nibName: "CommentsTableviewCell", bundle: nil), forCellReuseIdentifier: "CommentsTableviewCell")
        tableViewOutlet.separatorStyle = .none
        
    }
    


}
extension CommentsViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "CommentsTableviewCell", for: indexPath) as! CommentsTableviewCell
        cell.dp.image = UIImage(named: "001")
        cell.likes.text = likes[indexPath.row]
        cell.days.text = days[indexPath.row]
        cell.name.text = names[indexPath.row]
        cell.coment.text = pods[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    
    
}
