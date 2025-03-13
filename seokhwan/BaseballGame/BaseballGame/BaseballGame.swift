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
            print(BaseballGameText.appPrompt, terminator: "")

            guard let input = readLine() else {
                exitApp()
                return
            }
            guard let selectedOption = BaseballGameMenuOption(from: input) else {
                print(BaseballGameText.invalidNumber)
                continue
            }

            switch selectedOption {
            case .startGame:
                startGame()
            case .viewHistory:
                printRecords()
            case .exitApp:
                exitApp()
            }
        }
    }

    /**
     게임을 시작하고, 정답을 맞출 때까지 유저의 입력을 받고 결과를 출력하는 메서드
     */
    mutating func startGame() {
        let correctAnswer = randomAnswer()
        var attempt = 0
        print(BaseballGameText.startGame)

        while true {
            attempt += 1
            print(BaseballGameText.gamePrompt, terminator: "")

            guard let input = readLine() else {
                exitApp()
                return
            }
            guard let answer = validatedAnswer(from: input) else {
                print(BaseballGameText.invalidNumber)
                continue
            }

            switch StrikeBallEvaluator.evaluate(answer: answer, from: correctAnswer) {
            case .correct:
                print(BaseballGameText.correct)
                attempts.append(attempt)
                return
            case .partialCorrect(let strikes, let balls):
                print(BaseballGameText.partialCorrect(strikes, balls))
            case .incorrect:
                print(BaseballGameText.incorrect)
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
            let minAnswer = 102
            let maxAnswer = 987
            let answer = Int.random(in: minAnswer...maxAnswer)
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
    func printRecords() {
        var output = attempts.enumerated()
            .map { BaseballGameText.record($0.offset + 1, $0.element) }
            .reduce(BaseballGameText.viewHistoryTitle, +)

        if attempts.isEmpty {
            output += BaseballGameText.noRecords
        }
        print(output, terminator: "\n\n")
    }

    /**
     앱을 종료하는 메서드
     */
    func exitApp() {
        print(BaseballGameText.exit)
        exit(EXIT_SUCCESS)
    }
}
