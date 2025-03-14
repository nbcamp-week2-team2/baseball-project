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
    /// Parameters Type: nil
    /// Return:          nil
    func start() {
        print("Game Start")
        resetData()
        while true {
            displayMenu()
            guard let ch = readLine() else {
                print(ErrorCode.eofInputError.localizedDescription)
                return
            }
            switch (ch) {
            case "1":
                playGame()
            case "2":
                showGameRecord()
            case "3":
                print("Game Exit\n")
                resetData()
                return
            default:
                print(ErrorCode.generalInputError)
            }
        }
    }
    
    /// logic:           displayMenu
    /// Description:     display user selections
    /// Parameters Type: nil
    /// Return:          nil
    private func displayMenu() {
        print("1. Game Start\t2.Game Record\t3.Exit\n")
    }
    
    /// logic:           playGame
    /// Description:     loop until if the userinput is same as computer generated answer
    /// Parameters Type: nil
    /// Return:          nil
    private func playGame() {
        print("Enter the Number")
        currentTimeInterval = Date()
        var currentData = RecordHistory()
        while true {
            userInput = readLine()!
            if guess(history: &currentData) {
                print("Game End")
                let currentTimeEndInterval = Date()
                currentData.totalTime = currentTimeEndInterval.timeIntervalSince(currentTimeInterval)
                saveGameHistory(currentData)
                break;
            }
        }
    }
    
    /// logic:           guess
    /// Description:     check if the user input is valid, otherwise fill the data accordingly, return if
    ///                  user input is equal to computer generated data
    /// Parameters Type: RecordHistory (Ref)
    /// Return:          Bool
    private func guess(history: inout RecordHistory) -> Bool {
        do {
            try validate(userInput: &userInput)
        } catch let error as ErrorCode {
            print("\(error.localizedDescription)")
            return false
        } catch {
            print(error.localizedDescription)
            return false
        }
        
        var strikeBallRecord = StrikeBallRecord()
        calcScore(record: &strikeBallRecord)
        history.attempts += 1
        history.records.append(strikeBallRecord)
        print("strke: \(strikeBallRecord.strikeCount) - ball: \(strikeBallRecord.ballCount)")
        return strikeBallRecord.strikeCount == 3
    }
    
    /// Utils:           saveGameHistory
    /// Description:     As function_name: "guess" is done, push the data into Array to track the history
    /// Parameters Type: RecordHistory (Ref)
    /// Return:          nil
    private func saveGameHistory(_ history: RecordHistory) {
        histories.append(history)
    }
    
    /// Utils:           resetData
    /// Description:     to clear all data in Array.
    /// Parameters Type: nil
    /// Return:          nil
    private func resetData() {
        histories.removeAll()
    }
    
    /// Utils:           showGameRecord
    /// Description:     print the game states (# of game, # of attempts, total time)
    /// Parameters Type: nil
    /// Return:          nil
    private func showGameRecord() {
        print("< Show Records >")
        if histories.isEmpty {
            print(ErrorCode.emptyHistory.localizedDescription)
        } else {
            for (index, history) in histories.enumerated() {
                print("Game Number: \(index + 1) \nIteration: \(history.attempts) \n"
                      + "Total Time: \(history.totalTime) sec \n")
            }
        }
    }
    
    /// logic:           calcScore
    /// Description:     check if the user data are eqaul, depending on the result, return strikes / balls
    /// Parameters Type: StrikeBallRecord
    /// Return:          nil
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
    private func validate(userInput: inout String) throws {
        if !userInput.isNumeric {
            throw ErrorCode.invalidInputType
        }
        
        if userInput.count != 3 {
            throw ErrorCode.exceedMaxLength
        }
        
        if isFirstDigitZero(userInput) {
            throw ErrorCode.isFirstDigitZero
        }
        
        // TODO: Review -> guard let
        guard let userInputInt = Int(userInput) else {
            throw ErrorCode.repetitiveNumbers
        }
        if hasRepetitiveNumber(userInputInt) {
            throw ErrorCode.repetitiveNumbers
        }
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
