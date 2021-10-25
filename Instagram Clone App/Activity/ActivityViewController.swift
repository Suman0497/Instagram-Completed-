//
//  ActivityViewController.swift
//  Instagram Clone App
//
//  Created by apple on 24/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {

    @IBOutlet weak var activityTable: UITableView!
    @IBOutlet weak var segmentOut: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityTable.allowsSelection = false
        activityTable.dataSource = self
        activityTable.delegate = self
        activityTable.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstTableViewCell")
        activityTable.register(UINib(nibName: "SecondActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondActivityTableViewCell")
        activityTable.register(UINib(nibName: "ThirdTableViewCell", bundle: nil), forCellReuseIdentifier: "ThirdTableViewCell")
        navigationController?.isNavigationBarHidden = true
        segmentOut.addUnderlineForSelectedSegment()

    }
    
        @IBAction func segmentTapped(_ sender: UISegmentedControl) {
             segmentOut.changeUnderlinePosition()
             
             if segmentOut.selectedSegmentIndex == 0{
                 print("selected 0 index")
                let font = UIFont.boldSystemFont(ofSize: 20)
                segmentOut.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)


             }else{
    //             let sb = UIStoryboard.init(name: "Main", bundle: nil)
    //             let vc = sb.instantiateViewController(identifier: "SecondVC")
    //             self.navigationController?.pushViewController(vc, animated: true)
                // segmentOut.selectedSegmentIndex = 0

             }
         }


}
extension ActivityViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1{
            return 2
        }else{
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = activityTable.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for: indexPath) as! FirstTableViewCell
            return cell
        }else if indexPath.section == 1{
            let cell1 = activityTable.dequeueReusableCell(withIdentifier: "SecondActivityTableViewCell", for: indexPath) as! SecondActivityTableViewCell
            return cell1
        }else{
            let cell3 = activityTable.dequeueReusableCell(withIdentifier: "ThirdTableViewCell", for: indexPath) as! ThirdTableViewCell
            return cell3
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return ""
        }else if section == 1{
            return "This Month"
        }
        else{
            return "This Week"

        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}
