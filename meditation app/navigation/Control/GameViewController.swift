//
//  GameViewController.swift
//  navigation
//
//  Created by Jared Bondoc on 24/4/2023.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
        
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var name:String = "No Name"
    var timer = Timer()
    var remaningTime = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let minutes = remaningTime / 60
        let seconds = remaningTime % 60
        remainingTimeLabel.text = String(format: "%02d:%02d", minutes, seconds)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.counting()
        }
    }
    
    func counting(){
        remaningTime -= 1
        let minutes = remaningTime / 60
        let seconds = remaningTime % 60
        remainingTimeLabel.text = String(format: "%02d:%02d", minutes, seconds)
        if remaningTime == 0 {
            writeHighScores()
            timer.invalidate()
            
            //show highscore screen
            let vc =
            storyboard?.instantiateViewController(identifier: "HighScoreViewController") as! HighScoreViewController
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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
        // Append date and meditation time
        existingHighScores.append(GameScore(name: dateString, score: "test"))
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
