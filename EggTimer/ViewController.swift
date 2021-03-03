//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    let defaultMessage = "How do you like your eggs?"
    let doneMessage = "DONE"
    let eggTimes = ["Soft":300, "Medium":420, "Hard":720]
    var secondsRemaining = 0
    var timer : Timer?
    
    // MARK: - IBOutlets
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: - IBActions
    @IBAction func hardnessSelected(_ sender: UIButton) {
        guard let hardness = sender.currentTitle else {
           return
        }
        
        guard let seconds = eggTimes[hardness] else{
           return
        }
                
        startCoutdownTimerTo(seconds)
    }
    
    // MARK: - Public Methods
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining-=1
        }else{
            update(message: doneMessage)
            stopTimer()
        }
    }
    
    // MARK: - Private Methods
    private func startCoutdownTimerTo(_ seconds: Int) {
        update(message: defaultMessage)
        secondsRemaining = seconds
        stopTimer()
        startTimer()
    }
    
    private func startTimer(){
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    private func stopTimer(){
        if let t = timer{
            t.invalidate()
        }
    }
    
    private func update(message: String){
        messageLabel.text = message
    }
}
