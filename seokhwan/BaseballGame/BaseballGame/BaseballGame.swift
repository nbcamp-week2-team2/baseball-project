import Foundation

struct BaseballGame {
    func start() {
        let correctAnswer = randomAnswer()
        print("< 게임을 시작합니다 >")

        while true {
            print("숫자를 입력하세요\n>> ", terminator: "")

            guard let input = readLine(),
                  let answer = Int(input) else {
                print("올바르지 않은 입력값입니다")
                continue
            }

            if answer == correctAnswer {
                print("정답입니다!\n")
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

    private func randomAnswer() -> Int {
        while true {
            let answer = Array(String(Int.random(in: 102..<987)))

            guard answer[0] != answer[1],
                  answer[0] != answer[2],
                  answer[1] != answer[2] else { continue }

            return Int(String(answer)) ?? 0
        }
    }
}
