//
//  ViewController.swift
//  lesson4
//
//  Created by Yury Popov on 09/04/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit
import Spring

class ViewController: UIViewController {
    
    var animateView = Animate()
    var count = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var springView: SpringView!
    @IBOutlet weak var springButton: SpringButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        springView.layer.cornerRadius = springView.frame.size.width / 2
        springView.clipsToBounds = true
        springButton.layer.cornerRadius = 10
        animateView.animations.shuffle()
        animateView.curves.shuffle()
        springButton.setTitle("Run Animation", for: .normal)
        
    }

    @IBAction func runSpringAnimation(_ sender: SpringButton) {
        
        if count == animateView.animations.count - 1 {
            count = 0
            randomAnimation(view: springView)
        } else {
            randomAnimation(view: springView)
            count += 1
        }
        
        
        
    }
    
    func randomAnimation(view: SpringView) {
        
        let randomNumberCurve = Int.random(in: 0...animateView.curves.count - 1)
        
        label.text = "Animation: " + animateView.animations[count] + "\nCurve: \(animateView.curves[randomNumberCurve])"
        springButton.setTitle("Next: " + animateView.animations[count + 1], for: .normal)
        springView.animation = animateView.animations[count]
        springView.curve = animateView.curves[randomNumberCurve]
        springView.animate()
        
    }
}

