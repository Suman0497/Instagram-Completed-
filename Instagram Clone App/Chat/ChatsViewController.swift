//
//  ChatsViewController.swift
//  Instagram Clone App
//
//  Created by apple on 15/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {
    
    var images = ["002", "003", "004", "005", "006","007", "008", "009"]
    var names = ["Bharath", "Shama", "Axe", "Morphling", "Samera", "Ali", "Sameeksha", "Nisha"]

    var instaList = [InstaModel]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Chats"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        
    }
    

    
}
extension ChatsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        cell.namelbl.text = names[indexPath.row]
        cell.messagelbl.text = "Hello People"
       
        cell.images.image = UIImage(named: images[indexPath.row])
       return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
