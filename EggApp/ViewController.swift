//
//  ViewController.swift
//  EggApp
//
//  Created by Mrityunjay Kumar on 24/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    var timers = ["Soft": 5, "Medium": 7, "Hard": 12, "default": 10]
    
    var timer = Timer()
    
    var secondsRemaining = 60
    var totalTime = 0
    
    
    @IBOutlet weak var progrssBar: UIProgressView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func eggPressed(_ sender: UIButton) {
        timer.invalidate()
        
        statusLabel.text = "Let's Go..."
        progrssBar.progress = 0.0
        
        let selectedEgg = sender.titleLabel?.text! ?? "default"
        secondsRemaining = timers[selectedEgg]!
        totalTime = timers[selectedEgg]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeHandler), userInfo: nil, repeats: true)
        
    }
    
    @objc func timeHandler() {

        if secondsRemaining > 0 {
            
            print("\(secondsRemaining) seconds.")
            
            secondsRemaining -= 1
            
            statusLabel.text = "\(secondsRemaining) seconds remaining"
            
            progrssBar.progress = Float(totalTime - secondsRemaining) / Float(totalTime)
            
        } else {
            timer.invalidate()
            statusLabel.text = "Done!"
        }
        
    }
}
