import Foundation

extension Int {
    var hundreds: Int {
        return self / 100
    }

    var tens: Int {
        return self / 10 % 10
    }

    var units: Int {
        return self % 10
    }

    var isThreeDigit: Bool {
        return (100...999) ~= self
    }

    var isDistinct: Bool {
        let array = Array(String(self))
        let set = Set(array)

        return array.count == set.count
    }
}
