import Foundation

/**
 앱에 사용되는 문자열을 관리하는 유틸리티
 */
enum BaseballGameText {
    static let appPrompt = """
    환영합니다! 원하시는 번호를 입력해주세요
    1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
    >> 
    """
    static let invalidNumber = "올바른 숫자를 입력해주세요!\n"
    static let startGame = "\n< 게임을 시작합니다 >"
    static let gamePrompt = "숫자를 입력하세요\n>> "
    static let correct = "정답입니다!\n"
    static let incorrect = "Nothing\n"
    static let viewHistoryTitle = "\n< 게임 기록 보기 >"
    static let noRecords = "\n저장된 기록이 없습니다!"
    static let exit = "\n< 숫자 야구 게임을 종료합니다 >"

    static func partialCorrect(_ strikes: Int, _ balls: Int) -> String {
        return "\(strikes)스트라이크 \(balls)볼\n"
    }

    static func record(_ index: Int, _ attempt: Int) -> String {
        "\n\(index)번째 게임 : 시도 횟수 - \(attempt)"
    }
}
