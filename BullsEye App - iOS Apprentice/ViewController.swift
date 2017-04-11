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
    
    var currentValue: Int = 0
    var targetValue: Int = 0

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
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }

    // "Hit Me!" Button to display the alert popup and slider value
    @IBAction func showAlert() {
        
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        
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
    }
    
    // Implement movement of the slider
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        currentValue = lroundf(slider.value)
    }
    
}


// 1. Add outlets
// 2. Random numbers
// 3. Add new rounds
// 4. Add target value label



























