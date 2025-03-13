import Foundation

extension Int {
    /**
     세 자리로 구성된 숫자인지 확인하는 프로퍼티

     - Returns: 세 자리 숫자면 true, 세 자리 숫자가 아닐 경우 false 반환
     - Complexity: O(1)
     */
    var isThreeDigit: Bool {
        return (100...999) ~= self
    }

    /**
     모든 자릿수가 서로 다른 숫자인지 확인하는 프로퍼티

     - Returns: 모든 자릿수가 중복되지 않으면 true, 중복된 숫자가 있으면 false 반환
     - Complexity: O(n), n은 숫자의 자릿수
     */
    var isDistinct: Bool {
        let array = Array(String(self))
        let set = Set(array)

        return array.count == set.count
    }

    /**
     각 자릿수의 숫자를 요소로 가지는 Int 배열을 반환하는 프로퍼티

     - Returns: 각 자리 숫자로 이루어진 Int 배열
     - Complexity: O(n), n은 숫자의 자릿수
     */
    var digits: [Int] {
        return String(self).compactMap { $0.wholeNumberValue }
    }
}
