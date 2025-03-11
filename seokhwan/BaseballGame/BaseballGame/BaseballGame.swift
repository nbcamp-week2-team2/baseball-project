import Foundation

struct BaseballGame {
    enum StrikeBallResult {
        case correct
        case partialCorrect(strikes: Int, balls: Int)
        case incorrect
    }

    func startApp() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요\n1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기\n>> ", terminator: "")

            guard let selectedNumber = readLine() else {
                print("\n< 숫자 야구 게임을 종료합니다 >")
                exit(0)
            }

            switch selectedNumber {
            case "1":
                startGame()
            case "2":
                ()
            case "3":
                print("< 숫자 야구 게임을 종료합니다 >")
                exit(0)
            default:
                print("올바른 숫자를 입력해주세요!")
            }
            print()
        }
    }

    func startGame() {
        let correctAnswer = randomAnswer()
        print("\n< 게임을 시작합니다 >")

        while true {
            print("숫자를 입력하세요\n>> ", terminator: "")

            guard let input = readLine() else {
                print("\n< 숫자 야구 게임을 종료합니다 >")
                exit(0)
            }
            guard let answer = validatedAnswer(from: input) else {
                print("올바르지 않은 입력값입니다\n")
                continue
            }

            switch evaluate(answer: answer, from: correctAnswer) {
            case .correct:
                print("정답입니다!")
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
        guard input.count == 3,
              let answer = Int(input),
              answer.hundreds != 0,
              answer.isDistinct else { return nil }

        return answer
    }

    func evaluate(answer: Int, from correctAnswer: Int) -> StrikeBallResult {
        if answer == correctAnswer {
            return .correct
        }

        var strikes = 0
        var balls = 0

        if answer.hundreds == correctAnswer.hundreds {
            strikes += 1
        } else if answer.hundreds == correctAnswer.tens || answer.hundreds == correctAnswer.units {
            balls += 1
        }
        if answer.tens == correctAnswer.tens {
            strikes += 1
        } else if answer.tens == correctAnswer.hundreds || answer.tens == correctAnswer.units {
            balls += 1
        }
        if answer.units == correctAnswer.units {
            strikes += 1
        } else if answer.units == correctAnswer.hundreds || answer.units == correctAnswer.tens {
            balls += 1
        }

        if strikes == 0 && balls == 0 {
            return .incorrect
        }
        return .partialCorrect(strikes: strikes, balls: balls)
    }
}
