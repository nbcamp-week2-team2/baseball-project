//
//  main.swift
//  Baseball-project-JH
//
//  Created by 윤주형 on 3/10/25.
//

import Foundation

class GameFile {
    
    var attemps: [Int] = []
    var menuOption: Bool = true
    func start() {
        
        print("게임을 시작합니다")
        while menuOption {
            
            print("""
                  \n환영합니다! 원하시는 번호를 입력해주세요\n
                  1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기
                  """)
            let menuNumber = readLine()
            switch menuNumber {
                
            case "1" :
                print("< 게임을 시작합니다 >")
                print("숫자를 입력하세요")
                MenuSeletedNum1()
                continue
            case "2" :
                print("< 게임 기록 보기 >")
                GameRecord(attemps)
            case "3" :
                print(" < 숫자 야구 게임을 종료합니다.> ")
                menuOption = false
            default :
                print("메뉴의 정확한 번호를 입력해주세요")
            }
        }
    }
    
    func MenuSeletedNum1() {
        
        let generateAnswer = GenerateAnswer()
        let troubleCatch = TroubleCatch()
        var attemp: Int = 0
        let OwnerDigits = generateAnswer.createOwnerDigits()
        
        while true {
            
            attemp += 1
            print("시도 횟수: \(attemp)")
            //MARK: -- 자릿수 입력 오류 캐치 함수
            guard let userInputNum = readLine(), userInputNum.count == 3 else {
                return print("자릿수 입력 오류 입니다.")
            }
            
            let userDigits = generateAnswer.createUserDigits(userInputNum: userInputNum)
            
            if troubleCatch.CatchException(userInputNum) == false {
                continue
            }
            
            var strikeCount: Int = 0
            var ballCount: Int = 0
            
            for i in OwnerDigits.indices {
                if OwnerDigits[i] == userDigits?[i] {
                    strikeCount += 1
                } else if let userDigits = userDigits?[i], OwnerDigits.contains(userDigits){
                    ballCount += 1
                }
            }
            
            
            if strikeCount == 0 && ballCount == 0 {
                print("NOTHING")
            }
            else if strikeCount == 3 {
                attemps.append(attemp)
                print("정답입니다.")
                break
            } else {
                print("\(strikeCount)스트라이크 \(ballCount)볼")
            }
        }
    }
    
    func GameRecord(_ attemps: Array<Int>) {
        for (index, trial) in attemps.enumerated() {
            print("\(index + 1)번째 게임 : 시도 횟수 - \(trial)")
        }
    }
}


