// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SuwayomiKit",
    platforms: [.macOS(.v26), .iOS(.v26)],
    products: [
        .library(name: "SuwayomiKit", targets: ["API"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/apollographql/apollo-ios.git",
            .upToNextMajor(from: "2.0.0")
        )
    ],
    targets: [
        .target(
            name: "API",
            dependencies: [
                .product(name: "Apollo", package: "apollo-ios")
            ],
        )
    ],
    swiftLanguageModes: [.v6]
)
