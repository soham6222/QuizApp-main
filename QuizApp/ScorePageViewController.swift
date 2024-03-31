import UIKit

class ScorePageViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var score: String?  
        
        override func viewDidLoad() {
            super.viewDidLoad()
            if let score = score {
                scoreLabel.text = "Score: \(score)"
            }
        }
    }
