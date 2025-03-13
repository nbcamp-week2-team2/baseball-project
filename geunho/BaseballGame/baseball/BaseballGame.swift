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
            
            /// 승호님: String()으로 하는 건 어떨지?
            /// 욱현님: ?? "" 이유
            /// 석환님: EOF 이후 재역할을 못함, EOF 처리 필요!, Swift String에서는 왜 인덱스 접근이 안되는지?
            // 한 줄 입력으로 변경
            // EOF 처리 추가
            guard let input = readLine() else {
                print("\nEOF가 입력되었습니다. 게임을 종료합니다.")
                exit(EXIT_FAILURE)
            }
            userAnswer = input.map { String($0) }
            trialCount += 1
            
            
            
            
            // 입력 오류 처리
            if userAnswer.count != 3 {
                print("세 번호를 입력해주세요")
                continue
            } else if Set(userAnswer).count != 3 || !isInt(userAnswer) || userAnswer.contains("0"){
                print("올바르지 않는 입력값입니다")
                continue
            } else {
                // 잘못된 입력으로 힌트 얻기 방지
                
                // strike, ball 갱신
                for i in answer.indices {
                    if userAnswer[i] == answer[i] {
                        strikes += 1
                    } else if userAnswer.contains(answer[i]) {
                        balls += 1
                    }
                }
                // strike, ball 입력 체크
                if strikes == 3 {
                    print("정답입니다!\n")
                    // record 업데이트, 추가
                    updateRecord()
                    recordManager.addRecord()
                    // 재시작
                    welcome()
                } else if balls == 0 && strikes == 0 {
                    print("Nothing")
                } else {
                    print("\(strikes)스트라이크 \(balls)볼")
                }
            }
            
            
            
            
           
            
            
            
            
           
        }
    }
    
    // record 업데이트
    func updateRecord() {
        recordManager.records[gameCount] = trialCount
    }
    
    // 정수 판별
    func isInt(_ array: [String]) -> Bool {
        for i in 0 ..< array.count {
            guard Int(array[i]) != nil else { return false }
        }
        return true
    }
    
    // 정답 생성
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
        // 디버깅 시 정답 확인
        print("정답: \(answer.joined())")

        return answer
    }
    
    // MARK: - 게임 기록 보기
    func log() {
        if !recordManager.records.isEmpty {
            recordManager.showRecords()
        } else {
            print("\n기록이 없습니다")
        }
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

