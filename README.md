# Infrastructure Toolkit (Swift) for Vapor

This is an implementation of the [Infrastructure Toolkit](https://github.com/tombuildsstuff/infrastructure-toolkit-swift) for the Vapor web framework.

There's a [proper description](https://github.com/tombuildsstuff/infrastructure-toolkit-swift#fundamentals) on the [Infrastructure Toolkit repo](https://github.com/tombuildsstuff/infrastructure-toolkit-swift) - go check it out.

## Usage

### Step 1: Create a Monitor

```
import Foundation
import InfrastructureToolkit

@objc
public class ExampleServiceStatusMonitor : NSObject, ServiceStatusMonitor {

    public var name : String {
        get { return "Example" }
    }

    public func checkIsHealthy() throws -> ServiceStatusResult {
        let summary = "oh hai"
        var properties = [String: String]()
        properties["foo"] = "bar"
        properties["hello"] = "there"

        let metaData = ServiceStatusResultMetaData(summary, properties)
        return ServiceStatusResult(name: self.name, successful: true, metaData: metaData)
    }
    
}

```

### Step 2: Hook up the Routing

```
import HTTP
import InfrastructureToolkitVapor
import Vapor

let drop = Droplet(providers: [])

let monitors = [ SomeExampleMonitor() ]

drop.registerInfrastructureToolkit(monitors: monitors)

drop.get("/hello-world") {
  (request: Request) throws -> ResponseRepresentable in
    return "Hello World"
}

let port = 5000
drop.serve()

```

### Step 3: Build & Run
```
vapor build
vapor run
```

### Step 4: Try it out:
 - /service-status
 - /service-status/{monitorName}

## Licence
MIT
