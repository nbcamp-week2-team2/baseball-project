import Foundation

struct BaseballGame {
    enum StrikeBallResult {
        case correct
        case partialCorrect(strikes: Int, balls: Int)
        case incorrect
    }

    var attempts = [Int]()

    mutating func startApp() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요\n1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기\n>> ", terminator: "")

            guard let selectedNumber = readLine() else {
                exitApp()
                return
            }

            switch selectedNumber {
            case "1":
                startGame()
            case "2":
                printGameRecords()
            case "3":
                exitApp()
            default:
                print("올바른 숫자를 입력해주세요!\n")
            }
        }
    }

    mutating func startGame() {
        let correctAnswer = randomAnswer()
        var attempt = 0
        print("\n< 게임을 시작합니다 >")

        while true {
            attempt += 1
            print("숫자를 입력하세요\n>> ", terminator: "")

            guard let input = readLine() else {
                exitApp()
                return
            }
            guard let answer = validatedAnswer(from: input) else {
                print("올바르지 않은 입력값입니다\n")
                continue
            }

            switch evaluate(answer: answer, from: correctAnswer) {
            case .correct:
                print("정답입니다!\n")
                attempts.append(attempt)
                return
            case .partialCorrect(let strikes, let balls):
                print("\(strikes)스트라이크 \(balls)볼\n")
            case .incorrect:
                print("Nothing\n")
            }
        }
    }

    func randomAnswer() -> Int {
        while true {
            let answer = Int.random(in: 102...987)
            guard answer.isDistinct else { continue }

            return answer
        }
    }

    func validatedAnswer(from input: String) -> Int? {
        guard let answer = Int(input),
              answer.isThreeDigit,
              answer.isDistinct else { return nil }

        return answer
    }

    func evaluate(answer: Int, from correctAnswer: Int) -> StrikeBallResult {
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

    func printGameRecords() {
        var output = attempts.enumerated()
            .map { "\n\($0.offset + 1)번째 게임 : 시도 횟수 - \($0.element)" }
            .reduce("\n< 게임 기록 보기 >", +)

        if attempts.isEmpty {
            output += "\n저장된 기록이 없습니다!"
        }
        print("\(output)\n")
    }

    func exitApp() {
        print("\n< 숫자 야구 게임을 종료합니다 >")
        exit(0)
    }
}
