import Foundation

struct BaseballGame {
    private enum Message: String {
        case startGame = "< 게임을 시작합니다 >"
        case pleaseInputNumber = "숫자를 입력하세요\n>> "
        case invalidInput = "올바르지 않은 입력값입니다"
        case correctAnswer = "정답입니다!\n"
        case wrongAnswer = "오답입니다!\n"
    }

    func start() {
        let correctAnswer = randomAnswer()
        print(.startGame)

        while true {
            print(.pleaseInputNumber, terminator: "")

            guard let input = readLine(),
                  let answer = Int(input) else {
                print(.invalidInput)
                continue
            }

            if answer == correctAnswer {
                print(.correctAnswer)
                break
            } else {
                print(.wrongAnswer)
            }
        }
    }

    private func print(_ message: BaseballGame.Message, terminator: String = "\n") {
        Swift.print(message.rawValue, terminator: terminator)
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
