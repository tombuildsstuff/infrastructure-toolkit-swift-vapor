import PackageDescription

let package = Package(
    name: "InfrastructureToolkitVapor",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 0, minor: 18),
        .Package(url: "git@github.com:tombuildsstuff/infrastructure-toolkit-swift.git", majorVersion: 0, minor: 1)
    ]
)
