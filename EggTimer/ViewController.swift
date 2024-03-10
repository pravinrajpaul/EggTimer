//
//  ViewController.swift
//  EggTimer
//
//  Created by Pravin Raj Paul Raveendran on 10/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    
    
    let eggTimes: [String:Int] = ["Soft": 300, "Medium": 480, "Hard": 720]
    var timer = Timer()
    var storedHardness: String? = nil
    var storedTime = 0
    var hardnessTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cookingLevelTapped(_ sender: UIButton) {
        let hardness = (sender.titleLabel?.text)!
        if (storedHardness != hardness || storedHardness == nil) {
            timer.invalidate()
            storedTime = 0
            hardnessTime = eggTimes[hardness]!
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            storedHardness = hardness
        }
        else {return}
    }
    
    @objc func updateTimer() {
        if storedTime < hardnessTime {
            storedTime += 1
            progressBar.setProgress(Float(storedTime)/Float(hardnessTime), animated: true)
        }
        else {
            timer.invalidate()
            storedHardness = nil
        }
    }

}

