//  main.swift
//  Baseball-project-JH
//
//  Created by 윤주형 on 3/10/25.
//

import Foundation

//구조체 사용에 대해서 고려해볼것
//struct NumbersInfo {
//    let numberOfDigits: Int
//
//    init (numberOfDigits: Int) {
//        self.numberOfDigits = numberOfDigits
//    }
//}

class RunProgram {
    
    /* 2. 경우의 수 - [ ]  같은 자리에 같은 숫자가 있는 경우 **스트라이크**, 다른 자리에 숫자가 있는 경우 **볼**입니다
     - ex) 정답 : 456 인 경우
     - 435를 입력한 경우 → 1스트라이크 1볼
     - 357를 입력한 경우 → 1스트라이크
     - 678를 입력한 경우 → 1볼
     - 123를 입력한 경우 → Nothing
     다 맞는경우 게임 종료
     예외 경우 숫자 3개가 아닌 다른 값을 입력 받았을 때
     
     
     
     //MARK: -- guard let 과 if let의 사용 장단점에 대해서
     
     어떤 방식을 사용할까?
     guard let을 사용하는 경우:
     
     조건이 맞지 않으면 즉시 함수에서 빠져나가고 후속 코드 실행을 방지하고자 할 때 사용합니다. 보통 실패를 빠르게 처리하고, 이후의 로직이 깨끗하게 진행될 수 있도록 하기 위해 guard let을 사용합니다.
     예를 들어, 데이터 유효성 검사를 하고, 문제가 있으면 즉시 종료시키는 경우에 적합합니다.
     if else를 사용하는 경우:
     
     조건이 맞는 경우에만 작업을 하고, 그 외의 경우에는 다른 처리를 하고자 할 때 사용합니다. 더 유연한 분기 처리가 필요할 때 유리합니다.
     예를 들어, 여러 조건에 따라 다르게 처리해야 하는 경우나, 실패할 수 있는 작업을 중간에서 처리하고 싶을 때 유용합니다.
     
     */
    
    //MARK: -- 이제 while 문 돌려서 정답 맞을 때까지 돌리기
    func start() {
        //정답 생성
        print("게임을 시작합니다")
        let answerDigits = GenerateAnswer().createOnerDigits()
        
        while true {
            
            Swift.print("숫자를 입력하세요 (일단 단 세자리수까지):")
            var strikeCount: Int = 0
            var ballCount: Int = 0
            
            //MARK: -- 자릿수 입력 오류 캐치 함수
            guard let userInputNum = readLine(), userInputNum.count == 3 else {
                return Swift.print("자릿수 입력 오류 입니다.")
            }
            
            if TrobleCatch().catchException(userInputNum) == false {
                continue
            }
            let userDigits = GenerateAnswer().createUserDigits(userInputNum: userInputNum)
            
            for i in answerDigits.indices {
                if answerDigits[i] == userDigits?[i] {
                    strikeCount += 1
                } else if let userDigits = userDigits?[i], answerDigits.contains(userDigits){
                    ballCount += 1
                }
            }
            
            
            if strikeCount == 0 && ballCount == 0 {
                print("NOTHING")
            }
            else if strikeCount == 3 {
                print("정답입니다.")
            } else {
                print("\(strikeCount)스트라이크 \(ballCount)볼")
            }
        }
    }
}

//결합도 응집도 관련 공부


//MARK: -- 숫자 생성 및 숫자 분할 클래스
class GenerateAnswer {
    
    func createOnerDigits() -> [Int] {
        var answerArray: [Int] = []
        while answerArray.count < 3 {
            let answer = Int.random(in: 1...9)
            if !answerArray.contains(answer) {
                answerArray.append(answer)
            }
        }
        
        let hundredsAnswer = answerArray[0] //100의 자리 숫자
        let tensAnswer = answerArray[1] //10의 자리 숫자
        let unitsAnswer = answerArray[2] //1의 자리숫자
        
        print("정답 첫번째 자리: \(hundredsAnswer), 두번째 자리: \(tensAnswer), 세번째 자리: \(unitsAnswer)")
        return [hundredsAnswer, tensAnswer, unitsAnswer]
    }
    
    
    func createUserDigits(userInputNum: String) -> [Int]? {
        
        guard let convertedUserInputNumToInt = Int(userInputNum) else {
            return nil
        }
        
        let hundredsUserAnswer = convertedUserInputNumToInt / 100 // 100의 자리 숫자
        let tenssUserAnswer = (convertedUserInputNumToInt % 100) / 10 // 10의 자리 숫자
        let unitsUserAnswer = convertedUserInputNumToInt % 10 // 1의 자리 숫자
        
        return [hundredsUserAnswer, tenssUserAnswer, unitsUserAnswer]
    }
}

//MARK: -- 트러블 캐치 클래스
class TrobleCatch {
    
    //MARK: -- 사용자 입력값 중복 문자 캐치 함수
    func NumDuplicate(num: String) -> Bool {
        return Set(num).count != num.count  // 2 != 4 -> true
    }
    
    //MARK: -- 예외사항 에러 캐치 함수
    func catchException(_ userInputNum: String) -> Bool {
        // 범위를 넣는거는 너무 하드 코딩이라서 지양하고 1b2
        if Int(userInputNum) == nil  {
            print("숫자가 아닙니다.")
            return false
        }
        else if userInputNum.contains("0") {
            print("0을 포함하는 올바르지 않은 입력 값입니다.")
            return false
        }
        //중복되는 숫자가 있으면 탈락
        // 얘가 지금 string 같은 문자도 잡아낸다 일단 숫자인지 아닌지를 가장앞으로
        else if NumDuplicate(num: userInputNum) {
            print("true false 값 확인 : \(NumDuplicate(num: userInputNum))")
            print("중복되는 값이 있습니다.")
            return false
        }
        return true
    }
    
    
}


let start = RunProgram()
start.start()



