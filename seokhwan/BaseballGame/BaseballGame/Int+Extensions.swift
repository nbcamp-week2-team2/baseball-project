import Foundation

extension Int {
    var isThreeDigit: Bool {
        return (100...999) ~= self
    }

    var isDistinct: Bool {
        let array = Array(String(self))
        let set = Set(array)

        return array.count == set.count
    }

    var digits: [Int] {
        return String(self).compactMap { $0.wholeNumberValue }
    }
}
