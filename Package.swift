// swift-tools-version:5.9
// This package exists only to generate DocC documentation for the SpecNode
// specification repository. The runtime implementation will live under src.

import PackageDescription

let package = Package(
    name: "SpecNode",
    products: [
        .library(
            name: "SpecNode",
            targets: ["SpecNode"]
        ),
        .executable(
            name: "SpecNode-docs",
            targets: ["SpecNode-docs"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SpecNode",
            path: "Sources/SpecNode",
            exclude: []
        ),
        .executableTarget(
            name: "SpecNode-docs",
            path: "Sources/SpecNode-docs",
            exclude: []
        ),
    ]
)
