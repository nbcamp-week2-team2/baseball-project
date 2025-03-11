import Foundation

final class BaseballGame {
    private var answer: Int = 0
    private var userInput: String = ""
    private var currentTimeInterval: Date!
    private var histories: [RecordHistory] = []
    
    init() {
        answer = generateAnswer()
    }
    
    /// Logic:       Start
    /// Description: This is the main Game Loop (depending on the user input, this will loop infinite**
    func start() {
        print("Game Start")
        resetData()
        while (true) {
            displayMenu()
            let ch = readLine()!
            switch (ch) {
            case "1":
                playGame()
            case "2":
                showGameRecord()
            case "3":
                print("Game Exit")
                resetData()
                return
            default:
                print("Invalid ")
            }
        }
    }
    
    /// Utils:
    private func displayMenu() {
        print("1. Game Start\t2.Game Record\t3.Exit")
    }
    
    private func playGame() {
        print("Enter the Number")
        currentTimeInterval = Date()
        print(answer)
        var currentData = RecordHistory()
        while (true) {
            userInput = readLine()!
            if guess(record: &currentData) {
                print("Game End")
                let currentTimeEndInterval = Date()
                currentData.totalTime = currentTimeEndInterval.timeIntervalSince(currentTimeInterval)
                saveGameHistory(currentData)
                break;
            }
        }
    }
    
    /* Game Logic */
    private func guess(record: inout RecordHistory) -> Bool {
        if !validate(userInput: userInput){
            return false
        }
        
        var strikeBallRecord = StrikeBallRecord()
        record.attempts += 1
        calcScore(record: &strikeBallRecord)
        record.records.append(strikeBallRecord)
        print(strikeBallRecord.strikeCount, strikeBallRecord.ballCount)
        return strikeBallRecord.strikeCount == 3
    }
    
    private func saveGameHistory(_ history: RecordHistory) {
        histories.append(history)
    }
    
    private func resetData() {
        histories.removeAll()
    }
    
    private func showGameRecord() {
        print("< Show Records >")
        if histories.count <= 0 {
            print("No Record Found")
        } else {
            for (index, history) in histories.enumerated() {
                print("Game Number: \(index + 1)")
                print("Iteration: \(history.attempts)")
                print("Total Time: \(history.totalTime) sec")
                print()
            }
        }
    }
    
    /* Game Logic */
    private func calcScore(record: inout StrikeBallRecord) {
        let answerStr = String(answer)
        var strike = 0
        var ball = 0
        var answerSet = Set<Character>()
        
        for char in answerStr {
            answerSet.insert(char)
        }
        
        for idx in answerStr.indices {
            if (userInput[idx] == answerStr[idx]) {
                strike += 1
                answerSet.remove(userInput[idx])
            }
        }
        
        for idx in answerStr.indices {
            if (userInput[idx] != answerStr[idx] && answerSet.contains(userInput[idx])) {
                ball += 1
                answerSet.remove(userInput[idx])
            }
        }
        record.strikeCount = strike
        record.ballCount = ball
    }
    
    /// Utils:           generateAnswer & makeAnswer
    /// Description:     Generate the Random Number Depending on the seed
    /// Parameters Type: nil
    /// Return:          Int
    private func generateAnswer() -> Int {
        var gen = SeedRandomNumberGenerator(seed: Int(Date().timeIntervalSince1970))
        let num = Int(gen.next())
        // Check the Input Value
        if hasRepetitiveNumber(num) {
            return generateAnswer()
        }
        return num;
    }

    // TODO: Return this as Error Code
    private func validate(userInput: String) -> Bool {
        if !userInput.isNumeric {
            print(ErrorCode.invalidInputType.localizedDescription)
            return false
        }
        
        if userInput.count != 3 {
            print(ErrorCode.exceedMaxLength.localizedDescription)
            return false
        }
        
        if isFirstDigitZero(userInput) {
            print(ErrorCode.isFirstDigitZero.localizedDescription)
            return false
        }
        
        let userInputInt = Int(userInput)!
        if hasRepetitiveNumber(userInputInt) {
            print(ErrorCode.repetitiveNumbers.localizedDescription)
           return false
        }
        
        return true
    }
    
    /// Utils:           hasRepetitiveNumber
    /// Description:     Check whether there are repetitive number
    /// Parameters Type: Int
    /// Return:          Bool
    private func hasRepetitiveNumber(_ input: Int) -> Bool {
        let digits = String(input)
        return Set(digits).count < digits.count
    }
    
    /// Utils:           isFirstDigitZero
    /// Description:     Check whether the first digit is zero
    /// Parameters Type: String
    /// Return:          Bool
    private func isFirstDigitZero(_ input: String) -> Bool {
        return input.first == "0"
    }
}
