import Foundation
import UIKit

struct GameScore: Codable {
    var name: String
    var score: String
}

let KEY_HIGH_SCORE = "highScore"

class MeditationTrackerViewController: UIViewController {
    var UserScore: Int = 0
    var UserName: String = "No Name"
    @IBOutlet weak var tableView: UITableView!
    var highScores: [GameScore] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.highScores = readHighScores()

        // Set the delegate and dataSource for the tableView
        tableView.delegate = self
        tableView.dataSource = self
    }

    func readHighScores() -> [GameScore] {
        // Read from UserDefaults
        let defaults = UserDefaults.standard
        if let savedArrayData = defaults.value(forKey: KEY_HIGH_SCORE) as? Data {
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

extension MeditationTrackerViewController: UITableViewDelegate {
    // Implement any additional delegate methods if needed
}

extension MeditationTrackerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let score = highScores[indexPath.row]
        cell.textLabel?.text = score.name
        cell.detailTextLabel?.text = "Length: \(score.score)"
        
        return cell
    }
}
