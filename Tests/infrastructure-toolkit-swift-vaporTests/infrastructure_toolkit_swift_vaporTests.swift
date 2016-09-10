import XCTest
@testable import infrastructure_toolkit_swift_vapor

class infrastructure_toolkit_swift_vaporTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(infrastructure_toolkit_swift_vapor().text, "Hello, World!")
    }


    static var allTests : [(String, (infrastructure_toolkit_swift_vaporTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
