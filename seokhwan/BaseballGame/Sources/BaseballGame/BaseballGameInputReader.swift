import Foundation

/**
 사용자의 표준 입력을 읽는 유틸리티
 */
enum BaseballGameInputReader {
    /**
     표준 입력을 읽어 문자열로 반환하는 타입 메서드

     - Returns: 개행 문자가 제거된 유저의 입력값을 문자열로 반환하되, EOF가 입력되거나 UTF-8 변환에 실패할 경우 nil을 반환
     */
    static func readLine() -> String? {
        let data = FileHandle.standardInput.availableData

        guard !data.isEmpty,
              let input = String(data: data, encoding: .utf8) else { return nil }

        return input.trimmingCharacters(in: .newlines)
    }
}
