import XCTest

final class BaseballGameTests: XCTestCase {
    var baseballGame: BaseballGame!

    override func setUpWithError() throws {
        baseballGame = BaseballGame()
    }

    /*
     validatedAnswer(from:)에 대한 TC
     */
    func test_정상입력() throws {
        let input = 123
        XCTAssertEqual(input, baseballGame.validatedAnswer(from: "\(input)"))
    }

    func test_3자리가아닌입력() throws {
        XCTAssertNil(baseballGame.validatedAnswer(from: ""))
        XCTAssertNil(baseballGame.validatedAnswer(from: "12"))
        XCTAssertNil(baseballGame.validatedAnswer(from: "1234"))
    }

    func test_숫자가아닌입력() throws {
        XCTAssertNil(baseballGame.validatedAnswer(from: "abc"))
        XCTAssertNil(baseballGame.validatedAnswer(from: "a12"))
        XCTAssertNil(baseballGame.validatedAnswer(from: "   "))
    }

    func test_백의자리가0인입력() throws {
        XCTAssertNil(baseballGame.validatedAnswer(from: "012"))
    }

    func test_중복된숫자가있는입력() throws {
        XCTAssertNil(baseballGame.validatedAnswer(from: "112"))
        XCTAssertNil(baseballGame.validatedAnswer(from: "122"))
        XCTAssertNil(baseballGame.validatedAnswer(from: "212"))
    }

    /*
     Int+Extensions에 대한 TC
     */
    func test_백의자리추출() throws {
        let input = 123
        XCTAssertEqual(input.hundreds, 1)
    }

    func test_십의자리추출() throws {
        let input = 123
        XCTAssertEqual(input.tens, 2)
    }

    func test_일의자리추출() throws {
        let input = 123
        XCTAssertEqual(input.units, 3)
    }

    func test_중복숫자체크() throws {
        XCTAssertTrue(123.isDistinct)
        XCTAssertFalse(112.isDistinct)
        XCTAssertFalse(122.isDistinct)
        XCTAssertFalse(212.isDistinct)
        XCTAssertFalse(111.isDistinct)
    }
}
