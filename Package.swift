// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Deerchitecture",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "Deerchitecture",
            targets: ["Deerchitecture"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Deerchitecture",
            dependencies: []
        )
    ]
)
