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
}
