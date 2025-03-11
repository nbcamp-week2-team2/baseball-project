import Foundation

final class BaseballGame {
    private var answer: Int = 0
    private var userInput: String = ""
    private var currentResult: Dictionary<String, Int> = ["strike": 0, "ball": 0]
    // private var history = Dictionary<Int, Array>()
    
    init() {
        self.answer = generateAnswer()
    }
    
    /* start game loop */
    func start() {
        print("Game Start")
        while (true) {
            print("Enter the number")
            userInput = readLine()!
            if guess(){
                print("Game End")
                break;
            }
        }
    }
    
    /* makeAnswer (generate) would fit */
    private func generateAnswer() -> Int {
        var gen = SeedRandomNumberGenerator(seed: Int(Date().timeIntervalSince1970))
        let num = Int(gen.next())
        // Check the Input Value
        if hasRepetitiveNumber(num) {
            return generateAnswer()
        }
        return num;
    }
    
    private func guess() -> Bool {
        if !validate(userInput: userInput){
            return false
        }
        
        let (strike, ball) = calcScore()
        currentResult["strike"] = strike
        currentResult["ball"] = ball
        print(currentResult["strike"]!, currentResult["ball"]!)
        return strike == 3
    }
    
    private func calcScore() -> (strike: Int, ball: Int) {
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
        
        return (strike, ball)
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
    
    private func hasRepetitiveNumber(_ input: Int) -> Bool {
        let digits = String(input)
        return Set(digits).count < digits.count
    }
    
    private func isFirstDigitZero(_ input: String) -> Bool {
        return input.first == "0"
    }
}
