//
//  ViewController.swift
//  Proyecto2
//
//  Created by Guadalupe Morales carmona on 17/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - outlets
    @IBOutlet weak var h1: UILabel!
    
    @IBOutlet weak var chuckImage: UIImageView!
    
    @IBOutlet weak var joke: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var likeCounterLabel: UILabel!
    
    @IBOutlet weak var newJokeButton: UIButton!
    
    

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - variables
    
    private let imageIconLike = UIImage(systemName: "heart.fill")
    
    private  var likeCount = 0
    private var maxCounter = 99
    
    
    private let kTotalLikes = "totalLikes"
    private let kLastJoke = "lastJoke"
    
    //MARK: - viewDidLoad
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //label
        h1.text = "Chuck Norris Joke's Generator"
        h1.font = UIFont.boldSystemFont(ofSize: 36)
        h1.numberOfLines = 2
        h1.textAlignment = .center
        
        joke.textColor = .gray
        joke.font = UIFont.systemFont(ofSize: 16)
        joke.text = ""
        joke.numberOfLines = 0
        joke.textAlignment = .center
        
        
        likeCounterLabel.text = UserDefaults.standard.integer(forKey: kTotalLikes).description
        likeCounterLabel.font = UIFont.systemFont(ofSize: 16)
    
       
        
        //button
        likeButton.setTitle("", for: .normal)
        likeButton.setImage(imageIconLike, for: .normal)
        likeButton.tintColor = .red
    
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        newJokeAction(self)
        
     

    }
    
    // MARK: - Actions
    
    
    
    @IBAction func likeButtonAction(_ sender: Any) {
        
        likeCount += 1
        UserDefaults.standard.set(likeCount, forKey: kTotalLikes)
        
        if likeCount > maxCounter {
            likeCounterLabel.text = "\(maxCounter)+"
        
        }else{
            likeCounterLabel.text = "\(likeCount)"
          
        }
    }


    @IBAction func newJokeAction(_ sender: Any) {
        
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.getJoke() { (joke) in
            self.activityIndicator.stopAnimating()
            self.joke.text = joke.value
            
        } failure: { error in
            self.activityIndicator.stopAnimating()
            self.joke.text = error.debugDescription
            
        }
        
      
        
    
    }
    
    
}
