//
//  ViewController.swift
//  lesson2
//
//  Created by Yury Popov on 27/03/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redTextInput: UITextField!
    @IBOutlet weak var greenTextInput: UITextField!
    @IBOutlet weak var blueTextInput: UITextField!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 20
        viewColor.backgroundColor = UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 1)
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        redTextInput.delegate = self
        greenTextInput.delegate = self
        blueTextInput.delegate = self
//        addDoneButtonTo(redTextInput)
//        addDoneButtonTo(greenTextInput)
//        addDoneButtonTo(blueTextInput)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    

    @IBAction func rgbSlider(_ sender: UISlider) {
        
        
        
        switch sender.tag {
        case 0:
            redLabel.text = String(format: "%.2f", sender.value)
            redTextInput.text = redLabel.text
            viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        case 1:
            greenLabel.text = String(format: "%.2f", sender.value)
            greenTextInput.text = greenLabel.text
            viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        case 2:
            blueLabel.text = String(format: "%.2f", sender.value)
            blueTextInput.text = blueLabel.text
            viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        case 3:
            viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        default:
            break
        }
        
    }
    
    
    @IBAction func textInput(_ sender: UITextField) {
            changeFromTextInput(sender: sender)
        viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
      
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    
    
    func changeFromTextInput(sender: UITextField) {
       
        switch sender.tag {
        case 0:
            if sender.text == "" {
                return
            } else if (sender.text?.contains(","))! {
                sender.text = sender.text?.replacingOccurrences(of: ",", with: ".")
                redLabel.text = sender.text!
                let myFloat = (sender.text! as NSString).floatValue
                redSlider.value = myFloat
            } else {
                redLabel.text = sender.text!
                let myFloat = (sender.text! as NSString).floatValue
                redSlider.value = myFloat
            }
        case 1:
            if sender.text == "" {
                return
            } else if (sender.text?.contains(","))! {
                sender.text = sender.text?.replacingOccurrences(of: ",", with: ".")
                greenLabel.text = sender.text!
                let myFloat = (sender.text! as NSString).floatValue
                greenSlider.value = myFloat
            } else {
                greenLabel.text = sender.text!
                let myFloat = (sender.text! as NSString).floatValue
                greenSlider.value = myFloat
            }
        case 2:
            if sender.text == "" {
                return
            } else if (sender.text?.contains(","))! {
                sender.text = sender.text?.replacingOccurrences(of: ",", with: ".")
                blueLabel.text = sender.text!
                let myFloat = (sender.text! as NSString).floatValue
                blueSlider.value = myFloat
            } else {
                blueLabel.text = sender.text!
                let myFloat = (sender.text! as NSString).floatValue
                blueSlider.value = myFloat
            }
            
        default:
            break
        }
        
      
    }
    
  
//    private func addDoneButtonTo(_ textField: UITextField) {
//
//        let keyboardToolbar = UIToolbar()
//        textField.inputAccessoryView = keyboardToolbar
//        keyboardToolbar.sizeToFit()
//
//        let doneButton = UIBarButtonItem(title:"Done",
//                                         style: .done,
//                                         target: self,
//                                         action: #selector(didTapDone))
//
//        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
//                                            target: nil,
//                                            action: nil)
//
//
//
//        keyboardToolbar.items = [flexBarButton, doneButton]
//    }
//
//    @objc private func didTapDone() {
//        self.view.endEditing(true)
//    }
    
    
}


