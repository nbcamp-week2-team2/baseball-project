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
}

let game = BaseballGame()

welcome()

func welcome() {
//    var gameState: GameState
    var selectedState: String
    
    print("\n환영합니다! 원하시는 번호를 입력해주세요!")
    print("\(GameState.start.rawValue)  \(GameState.log.rawValue)  \(GameState.quit.rawValue)")
    
    selectedState = readLine() ?? ""
    
    switch selectedState {
    case "1":
//        gameState = .start
        game.start()
    case "2":
//        gameState = .log
        game.log()
    case "3":
//        gameState = .quit
        game.quit()
    default:
        print("올바른 번호를 입력해주세요")
    }
}

