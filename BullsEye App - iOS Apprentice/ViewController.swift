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
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }

    // "Hit Me!" Button to display the alert popup and slider value
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        // Display text based on how the player performs
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100 // Gain 100 bonus points for a perfect score
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50 // Gain 50 bonus points for being one off
            }
        } else if difference < 10 {
            title = "Pretty Good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        // Popup alert display messages
        let message = "You placed the slider on: \(currentValue)"
                    + "\nThe difference is: \(difference)"
                    + "\nYou scored \(points) points!"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: { action in
                                   self.startNewRound()       // Popup alert callback pattern event handler for starting new round
                                   self.updateLabels() } )   // and updating the labels
        
        alert.addAction(action)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    
    // Implement movement of the slider
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        currentValue = lroundf(slider.value)
    }
    
    // Start over button functionality
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    
}




























