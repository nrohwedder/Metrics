import XCTest
@testable import MetricsCLI

final class MetricsTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let request = MetricsRequest(workflow: "streckenagent", createdAt: "2023-06-13 15:38:08 +0000", status: "success", updatedAt: 2023-06-13T15:42:08Z)
        XCTAssertEqual(request.workflow, .streckenagent)
    }
}
