//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //This line below is an array
    //let egg: [String] = ["yummy", "good", "excellent"]
    //This line below is an dictionary
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!
    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 700] //seconds for now
    var timer = Timer()
    var totalTime: Float = 0
    var secondsPassed: Float = 0
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
                
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = Float(eggTimes[hardness]!)
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

        //if statement
        /*
        if hardness == "Soft" {
            print(softTime)
        } else if hardness == "Hard" {
            print(mediumTime)
        } else {
            print(hardTime)
        }
        */
        //switch statement
        /*
        switch hardness {
        case "Soft":
            print(softTime)
        case "Medium":
            print(mediumTime)
        case "Hard":
            print(hardTime)
        default:
            print("Error")
        }
        */
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress: Float = secondsPassed / totalTime
            progressBar.progress = percentageProgress
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!!!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    

    

}
