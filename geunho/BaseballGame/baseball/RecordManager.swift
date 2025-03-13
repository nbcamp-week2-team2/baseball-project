//
//  RecordManager.swift
//  baseball
//
//  Created by 정근호 on 3/11/25.
//

import Foundation

class RecordManager {
    
    var records = [Int:Int]()

    func showRecords() {
        let sortedRecords = records.sorted(by: { $0.key < $1.key })

        print("\n< 게임 기록 보기 >")
        
        for (key, value) in sortedRecords {
            print("\(key)번째 게임 : 시도 횟수 - \(value)")
        }
    }
}
