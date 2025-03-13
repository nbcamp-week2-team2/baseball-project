//
//  TroubleCatch.swift
//  BaseballGame
//
//  Created by 윤주형 on 3/13/25.
//

import Foundation

//MARK: -- 트러블 캐치 클래스
class TroubleCatch {
    
    func NumDuplicate(_ num: String) -> Bool {
        return Set(num).count != num.count
    }
    
    func CheckStringFirstAndSecondIndenx(is userInputNum: String) -> Bool {
        var Bool: Bool = true
        for (index, char) in userInputNum.enumerated() {
            if index == 0 && char == "0" {
                print("첫번째는 0이 올 수 없습니다.")
                Bool = false
            }
        }
        return Bool
    }
    
    //MARK: -- 예외사항 에러 캐치 함수
    func CatchException(_ userInputNum: String) -> Bool {
        if Int(userInputNum) == nil  {
            print("숫자가 아닙니다.")
            return false
        }
        else if CheckStringFirstAndSecondIndenx(is: userInputNum) == false {
            return false
        }
        else if NumDuplicate(userInputNum) {
            print("true false 값 확인 : \(NumDuplicate(userInputNum))")
            print("중복되는 값이 있습니다.")
            return false
        }
        return true
    }
    
    
}
