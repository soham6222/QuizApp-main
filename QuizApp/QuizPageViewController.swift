import UIKit

class QuizPageViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var radioButton1: UIButton!
    @IBOutlet weak var radioButton2: UIButton!
    @IBOutlet weak var radioButton3: UIButton!
    @IBOutlet weak var radioButton4: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var currentQuestionIndex = 0
    var userAnswers: [String?] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        userAnswers = Array(repeating: nil, count: QuestionBank.shared.questions.count)
                showQuestion(at: currentQuestionIndex)
    }
    
    func showQuestion(at index: Int) {
           let question = QuestionBank.shared.questions[index]
           questionLabel.text = question.question
           let allAnswers = [question.correctAnswer] + question.incorrectAnswers
           let shuffledAnswers = allAnswers.shuffled()
           radioButton1.setTitle(shuffledAnswers[0], for: .normal)
           radioButton2.setTitle(shuffledAnswers[1], for: .normal)
           radioButton3.setTitle(shuffledAnswers[2], for: .normal)
           radioButton4.setTitle(shuffledAnswers[3], for: .normal)
           
           let progress = Float(index + 1) / Float(QuestionBank.shared.questions.count)
           progressView.setProgress(progress, animated: true)
       }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        if currentQuestionIndex > 0 {
                    currentQuestionIndex -= 1
                    showQuestion(at: currentQuestionIndex)
                }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if currentQuestionIndex < QuestionBank.shared.questions.count - 1 {
                    currentQuestionIndex += 1
                    showQuestion(at: currentQuestionIndex)
                } else {
                    // Navigate to score page
                    performSegue(withIdentifier: "toScore", sender: self)
                }
    }
    
    @IBAction func radioButtonTapped(_ sender: UIButton) {
        userAnswers[currentQuestionIndex] = sender.titleLabel?.text

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScore" {
            if let scorePageVC = segue.destination as? ScorePageViewController {
                let score = calculateScore()
                scorePageVC.score = score  // Set the score to the instance property                }
            }
        }
    }
    func calculateScore() -> String {
            var correctAnswers = 0
            for (index, question) in QuestionBank.shared.questions.enumerated() {
                if userAnswers[index] == question.correctAnswer {
                    correctAnswers += 1
                }
            }
            let totalQuestions = QuestionBank.shared.questions.count
            return "\(correctAnswers)/\(totalQuestions)"
        }
    
}
