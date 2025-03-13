import XCTest

final class BaseballGameTests: XCTestCase {
    var baseballGame: BaseballGame!

    override func setUpWithError() throws {
        baseballGame = BaseballGame()
    }

    // MARK: - BaseballGame.validatedAnswer(from:)에 대한 TC
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

    // MARK: - Int+Extensions에 대한 TC
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

    // MARK: - StrikeBallEvalutor.evaluate(answer:from:)에 대한 TC
    func test_3스트라이크0볼() throws {
        switch StrikeBallEvaluator.evaluate(answer: 345, from: 345) {
        case .correct:
            break
        default:
            XCTFail()
        }
    }

    func test_2스트라이크0볼() throws {
        switch StrikeBallEvaluator.evaluate(answer: 245, from: 345) {
        case .partialCorrect(strikes: 2, balls: 0):
            break
        default:
            XCTFail()
        }
    }

    func test_1스트라이크2볼() throws {
        switch StrikeBallEvaluator.evaluate(answer: 435, from: 345) {
        case .partialCorrect(strikes: 1, balls: 2):
            break
        default:
            XCTFail()
        }
    }

    func test_1스트라이크1볼() throws {
        switch StrikeBallEvaluator.evaluate(answer: 485, from: 345) {
        case .partialCorrect(strikes: 1, balls: 1):
            break
        default:
            XCTFail()
        }
    }

    func test_1스트라이크0볼() throws {
        switch StrikeBallEvaluator.evaluate(answer: 942, from: 345) {
        case .partialCorrect(strikes: 1, balls: 0):
            break
        default:
            XCTFail()
        }
    }

    func test_0스트라이크3볼() throws {
        switch StrikeBallEvaluator.evaluate(answer: 534, from: 345) {
        case .partialCorrect(strikes: 0, balls: 3):
            break
        default:
            XCTFail()
        }
    }

    func test_0스트라이크2볼() throws {
        switch StrikeBallEvaluator.evaluate(answer: 753, from: 345) {
        case .partialCorrect(strikes: 0, balls: 2):
            break
        default:
            XCTFail()
        }
    }

    func test_0스트라이크1볼() throws {
        switch StrikeBallEvaluator.evaluate(answer: 783, from: 345) {
        case .partialCorrect(strikes: 0, balls: 1):
            break
        default:
            XCTFail()
        }
    }

    func test_0스트라이크0볼() throws {
        switch StrikeBallEvaluator.evaluate(answer: 789, from: 345) {
        case .incorrect:
            break
        default:
            XCTFail()
        }
    }
}
