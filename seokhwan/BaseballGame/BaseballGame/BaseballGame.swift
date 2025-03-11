import Foundation

struct BaseballGame {
    func startApp() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요\n1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기\n>> ", terminator:  "")
            switch readLine() {
            case "1":
                startGame()
            case "2":
                ()
            case "3":
                print("\n< 숫자 야구 게임을 종료합니다 >")
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

            guard let input = readLine(),
                  let answer = validatedAnswer(from: input) else {
                print("올바르지 않은 입력값입니다\n")
                continue
            }

            if answer == correctAnswer {
                print("정답입니다!")
                break
            }

            var strikeCount = 0
            var ballCount = 0

            if answer.hundreds == correctAnswer.hundreds {
                strikeCount += 1
            } else if answer.hundreds == correctAnswer.tens || answer.hundreds == correctAnswer.units {
                ballCount += 1
            }

            if answer.tens == correctAnswer.tens {
                strikeCount += 1
            } else if answer.tens == correctAnswer.hundreds || answer.tens == correctAnswer.units {
                ballCount += 1
            }

            if answer.units == correctAnswer.units {
                strikeCount += 1
            } else if answer.units == correctAnswer.hundreds || answer.units == correctAnswer.tens {
                ballCount += 1
            }

            let result = strikeCount == 0 && ballCount == 0 ? "Nothing\n" : "\(strikeCount)스트라이크 \(ballCount)볼\n"
            print(result)
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
        if input.count != 3 { return nil }
        guard let answer = Int(input) else { return nil }
        if answer.hundreds == 0 { return nil }
        if !answer.isDistinct { return nil }

        return answer
    }
}
