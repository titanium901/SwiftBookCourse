//
//  DetailVC.swift
//  lesson6
//
//  Created by Yury Popov on 15/04/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var detailHero = Hero()
    
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var idHero: UILabel!
    @IBOutlet weak var nameHero: UILabel!
    @IBOutlet weak var activiti: UIActivityIndicatorView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        activiti.startAnimating()
        activiti.hidesWhenStopped = true
//        print("DetailVC")
//        print(detailHero)
  
        
        idHero.text = detailHero.id ?? "No Connect"
        nameHero.text = detailHero.name ?? "No connect"

        DispatchQueue.global().async {
            guard let imageUrl = URL(string: self.detailHero.url ?? "no image") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.imageHero.image = UIImage(data: imageData)
                self.activiti.stopAnimating()
            }
        }
      
    }
    
  
    

   

}
