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
    let eggTimes = ["Soft":5, "Medium":7, "Hard":12]
    
    // MARK: - IBActions
    @IBAction func hardnessSelected(_ sender: UIButton) {
        guard let hardness = sender.currentTitle else {
           return
        }
        
        if let result = eggTimes[hardness]{
            print(result)
        }
    }    
}
