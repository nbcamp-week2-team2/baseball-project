//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by GO on 3/11/25.
//

import Foundation

class BaseballGame {
    
    func start() {
        let answer = makeAnswer()
        print("< 게임을 시작합니다. >")

        while true {
            print("숫자를 입력하세요")
            // input값의 nil, Int 여부 체크
            guard let userInput = readLine() else {
                print("올바르지 않은 입력값입니다.")
                continue
            }
            if !validation(input: userInput) {
                print("올바르지 않은 입력값입니다.")
                continue
            }
            
            
        }
        
    }
    
    func makeAnswer() -> Int {
        // 제약조건에 맞는 3자리 난수 생성
        while true {
            let randomNumber = Int.random(in: 123...987)
            if validation(input: String(randomNumber)) {
                return randomNumber
            }
        }
    }
    
    // 제약조건
    func validation(input: String) ->Bool {
        // 3자리인지 확인
        if input.count != 3 { return false }
        // 0 포함 여부 확인
        if input.contains("0") { return false }
        // 각 숫자 중복 X
        if input.count != Set(input).count { return false }
        
        return true
    }
}
