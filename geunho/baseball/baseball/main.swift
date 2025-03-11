//
//  main.swift
//  baseball
//
//  Created by 정근호 on 3/10/25.
//

import Foundation

enum GameState: String {
    case start = "1. 게임 시작하기"
    case log = "2. 게임 기록 보기"
    case quit = "3. 종료하기"
    
    func continueGame() {
        switch self {
        case .start:
            game.start()
        case .log:
            game.log()
        case .quit:
            game.quit()
        }
    }
}

let game = BaseballGame()
let gameState: GameState
var selectState: String

print("환영합니다! 원하시는 번호를 입력해주세요!")
print("\(GameState.start.rawValue)  \(GameState.log.rawValue)  \(GameState.quit.rawValue)")

selectState = readLine() ?? ""

switch selectState {
case "1":
    gameState = .start
    gameState.continueGame()
case "2":
    gameState = .log
    gameState.continueGame()
case "3":
    gameState = .quit
    gameState.continueGame()
default:
    print("올바른 번호를 입력해주세요")
}




