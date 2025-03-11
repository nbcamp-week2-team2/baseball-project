//
//  BaseballGame.swift
//  baseball
//
//  Created by 정근호 on 3/10/25.
//

import Foundation


class BaseballGame {
    
    let recordManager = RecordManager()
    
    var gameCount = 0
    var trialCount = 0
    
    
    // MARK: - 게임 시작하기
    func start() {
        let answer = makeAnswer()
        
        trialCount = 0
        
        print("< 게임을 시작합니다 >")
        gameCount += 1

        while true {
            print("\n숫자를 입력하세요")
            
            var userAnswer = [String]()
            var strikes = 0
            var balls = 0
            
            
            // 한 줄 입력으로 변경
            userAnswer = (readLine() ?? "").map { String($0) }
            trialCount += 1
            
            
            for i in 0..<3 {
                if userAnswer[i] == answer[i] {
                    strikes += 1
                } else if userAnswer.contains(answer[i]) {
                    balls += 1
                }
            }
            
            
            if balls == 0 && strikes == 0 {
                print("Nothing")
            } else if strikes == 3 {
                print("정답입니다!\n")
                recordManager.records[gameCount] = trialCount
                welcome()
            } else if Set(userAnswer).count != 3 || !isInt(userAnswer) || userAnswer.contains("0"){
                print("올바르지 않는 입력값입니다")
            }
            else {
                print("\(strikes)스트라이크 \(balls)볼")
            }
        }
    }
    
    func isInt(_ array: [String]) -> Bool {
        for i in 0 ..< array.count {
            guard Int(array[i]) != nil else { return false }
        }
        return true
    }
    
    func makeAnswer() -> [String] {
        var answer = [String]()
        var answerList = [String]()
        var count = 3
        
        for i in 1...9 {
            answerList.append("\(i)")
        }
        
       while true {
           if count < 1 { break }
           let rand = answerList.randomElement()!
           if !answer.contains(rand) {
               answer.append(rand)
               count -= 1
           } else {
               continue
           }
        }
        
        // 배열 -> 문자열 변환
        print("정답: \(answer.joined())")

        return answer
    }
    
    // MARK: - 게임 기록 보기
    func log() {
        recordManager.showRecords()
        welcome()
    }
    
    // MARK: - 종료하기
    func quit() {
        print("\n< 숫자 야구 게임을 종료합니다 >")
        gameCount = 0
        trialCount = 0
        exit(EXIT_SUCCESS)
    }
}

