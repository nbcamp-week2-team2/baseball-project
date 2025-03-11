//
//  RecordManager.swift
//  baseball
//
//  Created by 정근호 on 3/11/25.
//

import Foundation

class RecordManager {
    
    var recordsList = [String]()
    var records = [Int:Int]()
    
    func showRecords() {
        print("\n< 게임 기록 보기 >")
        
        for record in records {
            recordsList.append(("\(record.key)번째 게임 : 시도 횟수 - \(record.value)"))
        }
        recordsList.sort()
        
        recordsList.forEach {
            print($0)
        }
        
    }
    
    
}
