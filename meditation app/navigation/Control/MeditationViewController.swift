//
//  GameViewController.swift
//  navigation
//
//  Created by Jared Bondoc on 24/4/2023.
//

import Foundation
import UIKit

class MeditationViewController: UIViewController {
        
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var name:String = "No mood"
    var timer = Timer()
    var remaningTime = 60
    var originalTime = 0
    
    func remaningTimeInMinutes(Time: Int) -> String {
        let minutes = Time / 60
        let seconds = Time % 60
        let length = String(format: "%02d:%02d", minutes, seconds)
        return length
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        remainingTimeLabel.text = remaningTimeInMinutes(Time: remaningTime)
        originalTime = remaningTime
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.counting()
        }
    }
    
    func counting(){
        remaningTime -= 1
        remainingTimeLabel.text = remaningTimeInMinutes(Time: remaningTime)
        if remaningTime == 0 {
            writeHighScores()
            timer.invalidate()
            
            //show highscore screen
            let vc =
            storyboard?.instantiateViewController(identifier: "MeditationTrackerViewController") as! MeditationTrackerViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.setHidesBackButton(true, animated: true)
            //provide name and score for highscore table

        }
    }
    
    func writeHighScores() {
        // Write high scores to User Defaults
        let defaults = UserDefaults.standard;
        // Read existing high scores
        var existingHighScores = readHighScroes()
        //getting current date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = Date()
        let dateStringAndMood = dateFormatter.string(from: currentDate) + "     |     " + name
        // Append date and meditation time
        existingHighScores.append(GameScore(name: dateStringAndMood, score: remaningTimeInMinutes(Time: originalTime)
))
        // Write the updated array back to User Defaults
        defaults.set(try? PropertyListEncoder().encode(existingHighScores), forKey: KEY_HIGH_SCORE)
    }
    
    func readHighScroes() -> [GameScore] {
        // Read from User Defaults
        let defaults = UserDefaults.standard;
        if let savedArrayData = defaults.value(forKey:KEY_HIGH_SCORE) as? Data {
            if let array = try? PropertyListDecoder().decode(Array<GameScore>.self, from: savedArrayData) {
                return array
            } else {
                return []
            }
        } else {
            return []
        }
    }
    
}
