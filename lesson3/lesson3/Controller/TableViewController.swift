//
//  TableViewController.swift
//  lesson3
//
//  Created by Yury Popov on 08/04/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsArray.count
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = personsArray[indexPath.row].fullName
        cell.imageView?.image = UIImage(named: personsArray[indexPath.row].emogi)
        cell.accessoryType = .disclosureIndicator
        

        

        return cell
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailVC
                detailVC.person = personsArray[indexPath.row]
                
            }
        }
    }

    
}

//extension UITableViewCell {
//    override open var frame: CGRect {
//        get {
//            return super.frame
//        }
//        set (newFrame) {
//            var frame =  newFrame
//            frame.origin.y += 5
//            frame.origin.x += 5
//            frame.size.height -= 15
//            frame.size.width -= 2 * 10
//            super.frame = frame
//        }
//    }
//
//    override open func awakeFromNib() {
//        super.awakeFromNib()
//        layer.cornerRadius = 15
//        layer.masksToBounds = false
//    }
//}

