import HTTP
import InfrastructureToolkit
import Vapor

extension Droplet {

  public func registerInfrastructureToolkit(monitors: [ServiceStatusMonitor]) {
    let service = ServiceStatusMonitorExecutor(monitors: monitors)
    let controller = ServiceStatusController(droplet: self, service: service)

    self.get("/service-status", String.self, handler: controller.single)
    self.get("/service-status", handler: controller.all)
  }

}
