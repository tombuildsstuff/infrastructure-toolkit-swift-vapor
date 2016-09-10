import Foundation
import InfrastructureToolkit
import HTTP
import Vapor

public final class ServiceStatusController {

    private let drop: Droplet
    private let service: IServiceStatusMonitorExecutor

    public init(droplet: Droplet, service: IServiceStatusMonitorExecutor) {
        self.drop = droplet
        self.service = service
    }

    public func all(request: Request) throws -> ResponseRepresentable {
        let result = self.service.executeAll()
        let response = ServiceStatusMonitorsResponse(result)
        let statusCode : Status = response.successful ? .ok : .internalServerError
        let json = try response.toJson()
        return Response(status: statusCode, body: json)
    }

    public func single(request: Request, name: String) throws -> ResponseRepresentable {
        if (!self.service.exists(name: name)) {
          return Response(status: .notFound)
        }

        let result = self.service.execute(name: name)
        let statusCode : Status = result.successful ? .ok : .internalServerError
        let response = ServiceStatusMonitorResponse(result)
        let json = try response.toJson()
        return Response(status: statusCode, body: json)
    }

}
