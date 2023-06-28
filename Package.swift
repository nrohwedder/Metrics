// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Metrics",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "Metrics",
            targets: [
                "MetricsCLI"
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "1.0.3")),
    ],
    targets: [
        .executableTarget(
            name: "MetricsCLI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
    ]
)
