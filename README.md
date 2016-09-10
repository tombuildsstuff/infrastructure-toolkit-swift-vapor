# Infrastructure Toolkit (Swift) for Vapor

This is an implementation of the [Infrastructure Toolkit](https://github.com/tombuildsstuff/infrastructure-toolkit-swift) for the Vapor web framework.

## Usage

Wherever you're configuring your routes -

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

## Licence
MIT
