//
//  ViewController.swift
//  lesson5
//
//  Created by Yury Popov on 12/04/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

let url = "https://api.chucknorris.io/jokes/random"


class ViewController: UIViewController {
    private var norisJoke = Noris()

    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var animationLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateLogo()
        fetchData()
        
       
    }
    
    
   //Достаем данные и помещаем в в нашу структуру
    func fetchData() {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let _ = response else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.norisJoke = try decoder.decode(Noris.self, from: data)
            } catch let error {
                print("Error", error)
            }
         
        }.resume()
        
        
    }
    
    @IBAction func refresheJoke(_ sender: Any) {
        fetchData()
        changeValue(joke: norisJoke)
        
    }
    func changeValue(joke: Noris) {
        jokeLabel.text = joke.value ?? "No Joke(((("
        idLabel.text = "ID: " + "\(joke.id ?? "No id")"
        urlLabel.text = "URL: " + "\(joke.url ?? "No URL")"
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: joke.iconUrl!) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.iconImage.image = UIImage(data: imageData)
            }
        }
        
        
    }
    
    func animateLogo() {
        UIView.animate(withDuration: 1, delay: 0.5, options: [.autoreverse, .repeat,], animations: {
            self.animationLogo.frame.origin.x -= 20
           
        })
    }
 
}

