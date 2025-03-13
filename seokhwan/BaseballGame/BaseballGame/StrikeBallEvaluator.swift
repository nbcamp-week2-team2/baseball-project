import Foundation

enum StrikeBallEvaluator {
    enum StrikeBallResult {
        case correct
        case partialCorrect(strikes: Int, balls: Int)
        case incorrect
    }

    static func evaluate(answer: Int, from correctAnswer: Int) -> StrikeBallResult {
        guard answer != correctAnswer else { return .correct }
        let answer = answer.digits
        let correctAnswer = correctAnswer.digits

        var strikes = 0
        var balls = 0

        answer.enumerated().forEach { index, _ in
            strikes += answer[index] == correctAnswer[index] ? 1 : 0
            balls += answer[index] != correctAnswer[index] && correctAnswer.contains(answer[index]) ? 1 : 0
        }

        return strikes == 0 && balls == 0 ? .incorrect : .partialCorrect(strikes: strikes, balls: balls)
    }
}
