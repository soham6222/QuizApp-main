import UIKit

class QuestionBuilderViewController: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var correctAnswerTextField: UITextField!
    @IBOutlet weak var incorrectAnswer1TextField: UITextField!
    @IBOutlet weak var incorrectAnswer2TextField: UITextField!
    @IBOutlet weak var incorrectAnswer3TextField: UITextField!
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
        let question = Question(question: questionTextField.text ?? "",
                                        correctAnswer: correctAnswerTextField.text ?? "",
                                        incorrectAnswers: [incorrectAnswer1TextField.text ?? "",
                                                           incorrectAnswer2TextField.text ?? "",
                                                           incorrectAnswer3TextField.text ?? ""])
                QuestionBank.shared.addQuestion(question)
                dismiss(animated: true, completion: nil)
            }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
