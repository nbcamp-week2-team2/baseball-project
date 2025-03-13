//
//  asd.swift
//  BaseballGame
//
//  Created by 윤주형 on 3/13/25.
//

import Foundation

//MARK: -- 숫자 생성 및 숫자 분할 클래스
class GenerateAnswer {
    
    var maxDigits = 3
    func createOwnerDigits() -> [Int] {
        var answerArray: [Int] = []
        while answerArray.count < maxDigits {
            let answer = Int.random(in: 0...9)
            if !answerArray.contains(answer) {
                answerArray.append(answer)
                if answerArray.first == 0 {
                    answerArray.remove(at: 0)
                }
            }
        }
        print("정답 확인용: \(answerArray)")
        return answerArray
    }
    
    
    func createUserDigits(userInputNum: String) -> [Int]? {
        
        guard let convertedUserInputNumToInt = Int(userInputNum) else {
            return nil
        }
        
        let hundredsUserAnswer = convertedUserInputNumToInt / 100
        let tenssUserAnswer = (convertedUserInputNumToInt % 100) / 10
        let unitsUserAnswer = convertedUserInputNumToInt % 10
        
        return [hundredsUserAnswer, tenssUserAnswer, unitsUserAnswer]
    }
}

