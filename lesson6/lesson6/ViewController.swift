//
//  ViewController.swift
//  lesson6
//
//  Created by Yury Popov on 15/04/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    var hero = Hero()
    var imageUrl = ""
    

    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var activiti: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activiti.startAnimating()
        activiti.hidesWhenStopped = true
        button.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        id = Int.random(in: 2...600)
        imageUrl = "https://superheroapi.com/api/" + "\(apiKey)" + "\(id)" + "/image"
        fetchData()
        checkData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHero" {
            let detailVC = segue.destination as! DetailVC
            detailVC.detailHero = hero
        }
    }
    
    

    
    
    func fetchData() {
        guard let url = URL(string: imageUrl) else { return }
        
        request(url).validate().responseJSON { (responseJson) in
            switch responseJson.result {
            case .success(let value):
                guard let heroValue = value as? Dictionary<String, Any> else { return }

                self.hero = Hero(response: heroValue["response"] as? String,
                                 id: heroValue["id"] as? String,
                                 name: heroValue["name"] as? String,
                                 url: heroValue["url"] as? String)
                print("Загрузка")
                print(self.hero)
                self.checkData()
           
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func checkData() {
        if let _ = self.hero.id {
            button.isHidden = false
            activiti.stopAnimating()
        } else {
            button.isHidden = true
        }
    }

}

