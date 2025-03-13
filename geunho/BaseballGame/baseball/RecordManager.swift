//
//  RecordManager.swift
//  baseball
//
//  Created by 정근호 on 3/11/25.
//

import Foundation

class RecordManager {
    
    /// 승호님: Record 같은 경우 오히려 Dictionary 가 편합니다. 어떠한 Application 을 개발한다고 했을때는 Record 중에서 제일 Strike 가 많은 개수, 또는 총 걸린 시간들을 Key 값으로 가지면 훨씬 알고리즘 적으로 빨라집니다. (Hash O(1)).
    /// 석환님: 불필요한 프로퍼티명은 변수에 붙이지 말 것, 레코드 구조 변경, 딕셔너리 타입 순서 관련 학습(딕셔너리가 왜 필요했는지?, 과정 공유(만약에 딕셔너리에 이점이 있다면))
//    var recordsList = [String]()
    var records = [Int:Int]()

    
    
//    func addRecord() {
//        for record in records {
//            /// 주형님: 중복 false
//            /// 석환님: ==false -> !
//            if recordsList.contains("\(record.key)번째 게임 : 시도 횟수 - \(record.value)") == false {
//                
//                recordsList.append(("\(record.key)번째 게임 : 시도 횟수 - \(record.value)"))
//            }
//        }
//    }
    
    
    func showRecords() {
        print("\n< 게임 기록 보기 >")
        
        var sortedRecords = records.sorted(by: { $0.key < $1.key })
//        print(records.sorted{$0.key < $1.key}.map{$0.key})
//        print(records.sorted{$0.key < $1.key}.map{$0.value})// 만약 value로 정렬후 key만 출력하고 싶으면 이런식으로

        
//        for (key, value) in records {
//            print("\(key)번째 게임 : 시도 횟수 - \(value)")
//        }
        for (key, value) in sortedRecords {
            print("\(key)번째 게임 : 시도 횟수 - \(value)")
        }
    }
    
    
}
