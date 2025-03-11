/*  Define Error Code */
enum ErrorCode {
    case generalInputError
    case exceedMaxLength
    case invalidInputType
    case repetitiveNumbers
    case isFirstDigitZero
    var localizedDescription: String {
        switch self {
        case .generalInputError:
            return "The user input is invalid"
        case .invalidInputType:
            return "The user input is supposed to be a string"
        case .exceedMaxLength:
            return "The user input exceed the three digits"
        case .repetitiveNumbers:
            return "The user input must not contain repetitive numbers"
        case .isFirstDigitZero:
            return "The user input must not contain zero"
        }
    }
}
