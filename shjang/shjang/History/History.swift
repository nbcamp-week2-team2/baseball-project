import Foundation

struct StrikeBallRecord {
    var strikeCount: Int = 0
    var ballCount: Int = 0
}

struct RecordHistory {
    var attempts: Int = 0
    var totalTime: TimeInterval = 0.0
    var records: [StrikeBallRecord] = []
}
