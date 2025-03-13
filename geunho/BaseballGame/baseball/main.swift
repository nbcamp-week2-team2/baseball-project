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

runMainMenu()

// 메인 메뉴
func runMainMenu() {
    while true {
        var selectedState: String
        
        print("\n환영합니다! 원하시는 메뉴의 번호를 입력해주세요!")
        print("\(GameState.start.rawValue)  \(GameState.log.rawValue)  \(GameState.quit.rawValue)\n메뉴번호: ",terminator: "")
        
        guard let input = readLine() else {
            print("\n잘못된 입력입니다. 게임을 종료합니다.")
            exit(EXIT_FAILURE)
        }
        
        selectedState = input
        
        switch selectedState {
        case "1":
            game.start()
        case "2":
            game.showLog()
        case "3":
            game.quit()
        default:
            print("올바른 번호를 입력해주세요")
            continue
        }
    }
}

