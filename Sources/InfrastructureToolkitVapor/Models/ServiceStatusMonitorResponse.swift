import InfrastructureToolkit
import Vapor

public class ServiceStatusMonitorResponse {

  public let name : String
  public let successful : Bool
  public let metaData : ServiceStatusMonitorMetaDataResponse?

  public init(_ result: ServiceStatusResult) {
    self.name = result.name
    self.successful = result.successful
    self.metaData = ServiceStatusMonitorMetaDataResponse(result.metaData)
  }

  public func toJson() throws -> JSON {
    return try JSON(node: [
      "name": self.name,
      "successful": self.successful,
      "metaData": try self.metaData?.toJson()
    ])
  }

  public class ServiceStatusMonitorMetaDataResponse {
    let summary : String
    let properties : [String : String]?

    init?(_ metaData: ServiceStatusResultMetaData?) {
      guard let data = metaData else {
        return nil
      }

      self.summary = data.summary
      self.properties = data.properties
    }

    public func toJson() throws -> JSON {
      let propertiesJson = try self.properties.map {
        (properties: [String : String]) -> JSON in
        return try JSON(node: properties)
      }
      return try JSON(node: [
        "summary": self.summary,
        "properties": propertiesJson
      ])
    }
  }

}
