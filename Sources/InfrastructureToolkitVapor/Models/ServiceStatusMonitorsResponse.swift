import InfrastructureToolkit
import Vapor

public class ServiceStatusMonitorsResponse {

  public let successful : Bool
  public let monitors : [ServiceStatusMonitorResponse]

  public init(_ result: [ServiceStatusResult]) {
    self.monitors = result.map {
      (monitor : ServiceStatusResult) -> ServiceStatusMonitorResponse in
        return ServiceStatusMonitorResponse(monitor)
    }

    self.successful = result.filter({
      (monitor : ServiceStatusResult) in
        return !monitor.successful
    }).count == 0
  }

  public func toJson() throws -> JSON {
    let monitors = try self.monitors.map({
      (monitor: ServiceStatusMonitorResponse) -> JSON in
      return try monitor.toJson()
    })
    return try JSON(node: [
      "successful": self.successful,
      "monitors": JSON(monitors)
    ])
  }

}
