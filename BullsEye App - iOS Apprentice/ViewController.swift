//
//  ViewController.swift
//  BullsEye App - iOS Apprentice
//
//  Created by Owen Duignan on 10/04/2017.
//  Copyright © 2017 Owen Duignan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // "Hit Me!" Button to display the alert popup and slider value
    @IBAction func showAlert() {
        
        let message = "The value of the slider is: \(currentValue)"
        
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
    }
    
    // Implement movement of the slider
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        currentValue = lroundf(slider.value)
    }
    
}

