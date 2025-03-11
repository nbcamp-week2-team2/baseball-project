import Foundation

final class BaseballGame {
    static let shared = BaseballGame();
    
    private init() {
        answer = BaseballGame.generateAnswer()
    }
    
    private let answer: Int
    private var userInput: String!
    
    /* start game loop */
    func start() {
        print("Game Start")
        while (true) {
            print("Enter the number")
            userInput = readLine()
            if guess(userInput: userInput){
                print("Correct")
                break;
            }
        }
    }
    
    /* makeAnswer (generate) would fit */
    private static func generateAnswer() -> Int {
        var gen = SeedRandomNumberGenerator(seed: Int(Date().timeIntervalSince1970))
        let num = Int(gen.next())
        // Check the Input Value
        if hasRepetitiveNumber(num) {
            return BaseballGame.generateAnswer()
        }
        return num;
    }
    
    private func guess(userInput: String) -> Bool {
        if !validate(userInput: userInput){
            return false
        }
        
        guard let userInputInt = Int(userInput) else {
            return false
        }
        
        return userInputInt == answer
    }
    
    private func validate(userInput: String) -> Bool {
        if !userInput.isNumeric {
            return false
        }
        
        if userInput.count != 3 {
            return false
        }
        
        // convert this to Int
        let userInputInt = Int(userInput)!
        if BaseballGame.hasRepetitiveNumber(userInputInt) {
            return false
        }
        return true
    }
    
    private static func hasRepetitiveNumber(_ input: Int) -> Bool {
        let digits = String(input)
        var set = Set<Character>()
        
        for char in digits {
            if set.contains(char) {
                return true
            }
            set.insert(char)
        }
        return false;
    }
}
