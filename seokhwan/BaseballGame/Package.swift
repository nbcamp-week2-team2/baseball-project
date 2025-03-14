// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BaseballGame",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "BaseballGame",
            targets: ["BaseballGame"]
        ),
        .executable(
            name: "BaseballGameCLI",
            targets: ["BaseballGameCLI"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BaseballGame",
            dependencies: []
        ),
        .executableTarget(
            name: "BaseballGameCLI",
            dependencies: ["BaseballGame"]
        ),
        .testTarget(
            name: "BaseballGameTests",
            dependencies: ["BaseballGame"]
        )
    ]
)
