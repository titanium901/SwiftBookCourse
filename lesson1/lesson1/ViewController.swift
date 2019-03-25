//
//  ViewController.swift
//  lesson1
//
//  Created by Yury Popov on 25/03/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var colorOf = 0
    
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var buttonStart: UIButton!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var yellowLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.backgroundColor = .red
        redView.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        redView.layer.cornerRadius = redView.frame.size.width / 2
        
        yellowView.backgroundColor = .yellow
        yellowView.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)
        yellowView.layer.cornerRadius = yellowView.frame.size.width / 2
        
        greenView.backgroundColor = .green
        greenView.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        greenView.layer.cornerRadius = greenView.frame.size.width / 2
        
        redLabel.isHidden = true
        yellowLabel.isHidden = true
        greenLabel.isHidden = true
        
    }

    @IBAction func startButton(_ sender: Any) {
        
        buttonStart.setTitle("NEXT", for: .normal)
        
        switch colorOf {
        case 0:
            redView.backgroundColor = UIColor.red.withAlphaComponent(1)
            redLabel.isHidden = false
            colorOf += 1
        case 1:
            redView.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            yellowView.backgroundColor = UIColor.yellow.withAlphaComponent(1)
            redLabel.isHidden = true
            yellowLabel.isHidden = false
            colorOf += 1
        case 2:
            redView.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            yellowView.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)
            greenView.backgroundColor = UIColor.green.withAlphaComponent(1)
            redLabel.isHidden = true
            yellowLabel.isHidden = true
            greenLabel.isHidden = false
            colorOf += 1
        case 3:
            redView.backgroundColor = UIColor.red.withAlphaComponent(1)
            yellowView.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)
            greenView.backgroundColor = UIColor.green.withAlphaComponent(0.3)
            redLabel.isHidden = false
            yellowLabel.isHidden = true
            greenLabel.isHidden = true
            colorOf = 1
        default:
            break
        }
        print(colorOf)
        
    }
       
    
    
}

