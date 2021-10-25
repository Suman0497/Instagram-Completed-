//
//  ViewController.swift
//  Instagram Clone App
//
//  Created by apple on 17/10/21.
//  Copyright © 2021 apple. All rights reserved.
//
//

import UIKit
import BSImagePicker
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    var instaList = [InstaModel]()
        
    var likedBy = ["Liked by Shanvi and 30 more", "Liked by Nisha and 12 more", "Liked by Shama and 40 more", "Liked by Shanvi and 25 more", "Liked by Samanvi and 10 more", "Liked by Bhuvan and 50 more", "Liked by Chandru and 19 more", "Liked by Sameeksha and 19 more", "Liked by Fathima, shanvi and 35more", "Liked by Bharath and 40 more","Liked by Shanvi and 30 more", "Liked by Nisha and 12 more", "Liked by Shama and 40 more", "Liked by Shanvi and 25 more", "Liked by Samanvi and 10 more", "Liked by Bhuvan and 50 more", "Liked by Chandru and 19 more", "Liked by Sameeksha and 19 more", "Liked by Fathima, shanvi and 35more", "Liked by Bharath and 40 more"]
    
    var postedon = ["Posted 6 mins ago", "Posted 2h ago", "Posted 1day ago", "Posted 2days ago", "Posted 4days ago", "Posted 6days ago", "Posted a week ago", "Posted 10days ago", "Posted 12days ago", "Posted mon ago", "Posted 6 mins ago", "Posted 2h ago", "Posted 1day ago", "Posted 2days ago", "Posted 4days ago", "Posted 6days ago", "Posted a week ago", "Posted 10days ago", "Posted 12days ago", "Posted mon ago"]
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        
        
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

        
        
        
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//               var imagePicker = UIImagePickerController()
//               imagePicker.delegate = self
//               imagePicker.sourceType = .camera;
//               imagePicker.allowsEditing = false
//            self.present(imagePicker, animated: true, completion: nil)
//           }
        
        }
        func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
              let selectedImage : UIImage = image
              print("selected image \(selectedImage)")
          }
    
    
    @IBAction func directMessegeTapped(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "ChatsViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        tableViewOutlet.register(UINib(nibName: "FirstSectionTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstSectionTableViewCell")
        
        
        tableViewOutlet.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondTableViewCell")
        tableViewOutlet.allowsSelection = false
        navigationItem.title = "Instagram"
        getInstaDetails { (success) in
            print(self.instaList.count)
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    
}
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            print("Instalist count is\(instaList.count)")
            return instaList.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
                let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "FirstSectionTableViewCell", for: indexPath) as! FirstSectionTableViewCell
                cell.backgroundColor = .white
            
                return cell
            
        }else {
            
            let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell
            cell.usernameLbl1.text = instaList[indexPath.row].localized_name
            cell.likeLbl1.text = likedBy[indexPath.row]
            cell.timeLbl1.text = postedon[indexPath.row]
            let defaultLink = "https://api.opendota.com"
            let completedLink = defaultLink + instaList[indexPath.row].img
            cell.displayPicture1.downloaded(from: completedLink)
            
            
            
            return cell
            
        }
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }else{
            return 460
        }
    }
    
   
    
}

extension ViewController {
    
    
    
    func getInstaDetails(completionHandler handler: @escaping (_ success: Bool)-> Void){
        let session = URLSession(configuration: .default)
        if let url = URL(string: "https://6166bf7e13aa1d00170a66a9.mockapi.io/getAllAdress/InstaStoryDetails"){
            let urlRequest = URLRequest(url: url)
            
            let dataTask = session.dataTask(with: urlRequest,completionHandler: { (data, urlResponse, error) in
                if let response = urlResponse as? HTTPURLResponse, response.statusCode == 200{
                    do{
                        if let responseData = data{
                            self.instaList = try JSONDecoder().decode([InstaModel].self, from: responseData)
                            
                            DispatchQueue.main.async {
                                self.tableViewOutlet.reloadData()
                                handler(true)
                            }
                        }
                        
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            })
            dataTask.resume()
            
        }
    }
    
}




