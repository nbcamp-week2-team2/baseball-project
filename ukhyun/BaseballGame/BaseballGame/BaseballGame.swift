//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by GO on 3/11/25.
//

import Foundation

enum gameResult {
    case correct
    case partialMatch(strikeCount: Int, ballCount: Int)
    case incorrect
    
    var description: String {
        switch self {
        case .correct: return "정답입니다!"
        case .partialMatch(let strikeCount, let ballCount): return "\(strikeCount)스트라이크, \(ballCount)볼"
        case .incorrect: return "Nothing"
        }
    }
}

class BaseballGame {
    
    var attemptRecords = [Int]()
    
    func startProgram() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요\n1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            
            guard let userInput = readLine() else {
                print("오류 발생 - 게임을 종료합니다.")
                exit(0)
            }
            
            switch userInput {
            case "1": startBaseballGame()
            case "2": printAttemptRecord()
            case "3":
                print("게임을 종료합니다.")
                exit(0)
            default: print("올바르지 않은 입력값입니다.")
            }
        }
        
    }
    
    func startBaseballGame() {
        
        var attemptCount = 0
        
        let answer = makeAnswer()
        print("< 게임을 시작합니다. >")
        
        while true {
            print("숫자를 입력하세요")
            // input값의 nil, Int 여부 체크
            guard let userInput = readLine() else {
                print("오류 발생 - 게임을 종료합니다.")
                exit(0)
            }
            if !validation(input: userInput) {
                print("올바르지 않은 입력값입니다.")
                continue
            }
            
            attemptCount += 1
            
            // 힌트 및 정답
            guard let userInput = Int(userInput) else {
                print("올바르지 않은 입력값입니다.")
                continue
            }
            let result = compare(answer: answer, with: userInput)
            
            switch result {
            case .correct:
                print(result.description)
                attemptRecords.append(attemptCount)
                return
            case .partialMatch:
                print(result.description)
            case .incorrect:
                print(result.description)
            }
        }
    }
    
    func makeAnswer() -> Int {
        // 제약조건에 맞는 3자리 난수 생성
        while true {
            let randomNumber = Int.random(in: 123...987)
            if validation(input: String(randomNumber)) {
                print(randomNumber)
                return randomNumber
            }
        }
    }
    
    // 제약조건
    func validation(input: String) -> Bool {
        // 3자리인지 확인
        if input.count != 3 { return false }
        // 백의 자리에 0 불가
        if input.first == "0" { return false }
        // 각 숫자 중복 X
        if input.count != Set(input).count { return false }
        
        return true
    }

    // randomNumber, userInput 비교 로직
    func compare(answer: Int, with userInput: Int) -> gameResult {
        
        var strikeCount = 0
        var ballCount = 0
        
        let answerArray = String(answer).map { String($0) }
        let userInputArray = String(userInput).map { String($0) }
        
        for i in answerArray.indices {
            if answerArray[i] == userInputArray[i] {
                strikeCount += 1
            } else if answerArray.contains(userInputArray[i]) {
                ballCount += 1
            }
        }
        
        if strikeCount == 3 {
            return gameResult.correct
        } else if strikeCount == 0 && ballCount == 0 {
            return gameResult.incorrect
        } else {
            return gameResult.partialMatch(strikeCount: strikeCount, ballCount: ballCount)
        }
    }
    
    // 게임 기록
    func printAttemptRecord() {
        print("< 게임 기록 보기 >")
        for i in attemptRecords.indices {
            print("\(i + 1)번째 게임 : 시도 횟수 - \(attemptRecords[i])")
        }
    }
}
