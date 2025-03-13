import Foundation

/**
 앱에서 제공하는 메뉴 옵션 열거형
 */
enum BaseballGameMenuOption: String {
    case startGame = "1"
    case viewHistory = "2"
    case exitApp = "3"

    /**
     유저의 입력에 따라 MenuOption 값을 생성하는 이니셜라이저

     - Parameters:
        - input: 유저가 입력한 문자열
     */
    init?(from input: String) {
        switch input {
        case "1":
            self = .startGame
        case "2":
            self = .viewHistory
        case "3":
            self = .exitApp
        default:
            return nil
        }
    }
}
