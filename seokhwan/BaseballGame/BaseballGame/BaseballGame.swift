import Foundation

/**
 BaseballGame을 관리하는 구조체
 */
struct BaseballGame {
    /**
     게임별 시도 횟수를 저장하는 정수 배열
     */
    private var attempts = [Int]()

    /**
     앱을 시작하고, 유저의 입력에 따라 로직을 분기하는 메서드
     */
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

    /**
     게임을 시작하고, 정답을 맞출 때까지 유저의 입력을 받고 결과를 출력하는 메서드
     */
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

            switch StrikeBallEvaluator.evaluate(answer: answer, from: correctAnswer) {
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

    /**
     각 자릿수가 모두 다른 랜덤한 3자리 정수를 생성하는 메서드

     - Returns: 각 자릿수가 모두 다른 랜덤한 3자리 정수
     - Complexity: 평균적으로 O(1)
     */
    func randomAnswer() -> Int {
        while true {
            let answer = Int.random(in: 102...987)
            guard answer.isDistinct else { continue }

            return answer
        }
    }

    /**
     String 입력값이 유효한 값인지 검증한 뒤, Int 값으로 캐스팅해서 반환하는 메서드

     - Parameters:
        - input: 유저의 입력값(숫자로 변환 가능한 문자열)
     - Returns: 유효(숫자로 변환 가능, 3자리수, 중복 숫자 없음)할 경우 3자리 Int 반환, 유효하지 않을 경우 nil 반환
     - Complexity: 평균적으로 O(1)
     */
    func validatedAnswer(from input: String) -> Int? {
        guard let answer = Int(input),
              answer.isThreeDigit,
              answer.isDistinct else { return nil }

        return answer
    }

    /**
     게임 기록을 출력하는 메서드
     */
    func printGameRecords() {
        var output = attempts.enumerated()
            .map { "\n\($0.offset + 1)번째 게임 : 시도 횟수 - \($0.element)" }
            .reduce("\n< 게임 기록 보기 >", +)

        if attempts.isEmpty {
            output += "\n저장된 기록이 없습니다!"
        }
        print("\(output)\n")
    }

    /**
     앱을 종료하는 메서드
     */
    func exitApp() {
        print("\n< 숫자 야구 게임을 종료합니다 >")
        exit(0)
    }
}
