import Foundation

/**
 BaseballGame에서 입력된 숫자와 정답을 비교하여 결과를 판정하는 유틸리티
 */
enum BaseballGameStrikeBallEvaluator {
    /**
     판정 결과를 나타내는 열거형
     */
    enum StrikeBallResult {
        case correct
        case partialCorrect(strikes: Int, balls: Int)
        case incorrect
    }

    /**
     입력된 숫자와 정답을 비교하여 스트라이크와 볼을 판정하는 타입 메서드

     - Parameters:
        - answer: 유저가 입력한 숫자
        - correctAnswer: 정답 숫자
     - Returns: 판정 결과를 StrikeBallResult 타입으로 반환
     - Complexity: O(n^2), n은 answer의 자릿수
     */
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
