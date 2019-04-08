//
//  DetailVC.swift
//  lesson3
//
//  Created by Yury Popov on 08/04/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var imageOfPerson: UIImageView!
    @IBOutlet weak var nameOfPerson: UILabel!
    @IBOutlet weak var emailOfPerson: UILabel!
    @IBOutlet weak var phoneOfPerson: UILabel!
    
    var person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOfPerson.text = person.fullName
        emailOfPerson.text = person.email
        imageOfPerson.image = UIImage(named: person.emogi)
        phoneOfPerson.text = person.phoneNumber
       
    }
    

    

}
