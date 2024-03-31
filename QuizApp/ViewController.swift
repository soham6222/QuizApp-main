import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Quiz"
    }

    
    @IBAction func buildQuestionBankTapped(_ sender: UIButton) {
    }
    
    @IBAction func startQuizTapped(_ sender: Any) {
        if QuestionBank.shared.questions.isEmpty {
                   showAlert(message: "No questions in the question bank.")
               } else {
               }
        
    }
    
    func showAlert(message: String) {
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    


