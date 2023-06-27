import Foundation
import ArgumentParser

enum MetricsCLIError: Error {
    case runtime
}

@main
struct MetricsCLI: AsyncParsableCommand {
    @Argument private var workflow: String
    @Argument private var createdAt: String
    @Argument private var status: String
    @Argument private var updatedAt: String
    
    func run() async throws {
        print("Workflow:\(workflow), createdAt:\(createdAt), status:\(status), updatedAt:\(updatedAt)")
        let request = try MetricsRequest(workflow: workflow, createdAt: createdAt, status: status, updatedAt: updatedAt)
        print("Successfully created request: \(request.workflow) \(request.createdAt) \(request.status) \(request.duration)")
    }
}
