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
        XCTAssertNil(baseballGame.validatedAnswer(from: "111"))
    }

    /*
     Int+Extensions에 대한 TC
     */
    func test_3자리숫자인지체크() throws {
        XCTAssertFalse(3.isThreeDigit)
        XCTAssertFalse(99.isThreeDigit)
        XCTAssertTrue(100.isThreeDigit)
        XCTAssertTrue(456.isThreeDigit)
        XCTAssertTrue(999.isThreeDigit)
        XCTAssertFalse(1000.isThreeDigit)
    }

    func test_중복숫자체크() throws {
        XCTAssertTrue(123.isDistinct)
        XCTAssertFalse(112.isDistinct)
        XCTAssertFalse(122.isDistinct)
        XCTAssertFalse(212.isDistinct)
        XCTAssertFalse(111.isDistinct)
    }

    func test_자릿수분리체크() throws {
        XCTAssertEqual(123.digits, [1, 2, 3])
    }
}
