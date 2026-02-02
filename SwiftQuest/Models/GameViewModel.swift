import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var currentQuestionIndex = 0
    @Published var score = 0
    @Published var selectedAnswer: Int? = nil
    @Published var isAnswered = false
    @Published var isGameStarted = false

    var currentQuestion: Question {
        guard currentQuestionIndex < questions.count else {
            return questions[0]
        }
        return questions[currentQuestionIndex]
    }

    init() {
        loadQuestions()
    }

    func loadQuestions() {
        questions = Question.sampleQuestions.shuffled()
    }

    func startGame() {
        isGameStarted = true
        resetGame()
    }

    func checkAnswer() {
        guard let selected = selectedAnswer else { return }

        isAnswered = true

        if selected == currentQuestion.correctAnswer {
            score += calculatePoints()
        }
    }

    func calculatePoints() -> Int {
        switch currentQuestion.difficulty {
        case .beginner:
            return 10
        case .intermediate:
            return 20
        case .advanced:
            return 30
        }
    }

    func moveToNextQuestion() -> Bool {
        selectedAnswer = nil
        isAnswered = false

        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            return false
        } else {
            return true
        }
    }

    func resetGame() {
        currentQuestionIndex = 0
        score = 0
        selectedAnswer = nil
        isAnswered = false
        loadQuestions()
    }
}
