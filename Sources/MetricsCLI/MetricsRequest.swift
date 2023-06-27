import Foundation

enum MetricsRequestError: Error {
    case parsingWorkflow, parsingCreatedAtDate, parsingStatus, parsingUpdatedAtDate
}

struct MetricsRequest: Encodable {
    let workflow: Workflow
    let createdAt: Date
    let status: Status
    let duration: TimeInterval
    
    init(workflow: Workflow, createdAt: Date, status: Status, duration: TimeInterval) {
        self.workflow = workflow
        self.createdAt = createdAt
        self.status = status
        self.duration = duration
    }
    
    init(workflow: String, createdAt: String, status: String, updatedAt: String) throws {
        guard let workflow = Workflow(rawValue: workflow) else {
            throw MetricsRequestError.parsingWorkflow
        }

        guard let createdAt = DateCoder.decode(string: createdAt) else {
            throw MetricsRequestError.parsingCreatedAtDate
        }
        
        guard let status = Status(rawValue: status) else {
            throw MetricsRequestError.parsingStatus
        }

        guard let updatedAt = DateCoder.decode(string: updatedAt) else {
            throw MetricsRequestError.parsingUpdatedAtDate
        }
        
        self.init(workflow: workflow, createdAt: createdAt, status: status, duration: updatedAt.timeIntervalSince(createdAt))
    }
}
