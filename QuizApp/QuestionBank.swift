
import Foundation

class QuestionBank {
    static let shared = QuestionBank()
    private init() {}
    
    var questions: [Question] = []
    
    func addQuestion(_ question: Question) {
        questions.append(question)
    }
}
