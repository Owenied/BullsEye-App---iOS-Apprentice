//
//  ViewController.swift
//  BullsEye App - iOS Apprentice
//
//  Created by Owen Duignan on 10/04/2017.
//  Copyright © 2017 Owen Duignan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }

    // "Hit Me!" Button to display the alert popup and slider value
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        let message = "The value of the slider is: \(currentValue)"
                    + "\nThe target value is: \(targetValue)"
                    + "\nThe difference is: \(difference)"
                    + "\nYou scored \(points) points!"
        
        let alert = UIAlertController(title: "Hello World",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        
        present(alert,
                animated: true,
                completion: nil)
        
        startNewRound()
        updateLabels()
    }
    
    func updateLabels() {
        
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    // Implement movement of the slider
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        currentValue = lroundf(slider.value)
    }
    
}


// 1. Get the difference between current value and targetValue
// 2. Add player's score
// 3. Increment rounds on screen



























