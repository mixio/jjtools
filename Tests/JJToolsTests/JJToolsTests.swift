import XCTest
@testable import JJTools

final class JJToolsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let variable = "toto"
        let reflection = String(reflecting: variable)
        jjprintex(reflection)

    }


    static var allTests = [
        ("testExample", testExample),
    ]
}

