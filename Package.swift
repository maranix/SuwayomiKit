// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SuwayomiKit",
    platforms: [.macOS(.v15), .iOS(.v15)],
    products: [
        .library(name: "SuwayomiKit", targets: ["SuwayomiKit"])
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
            ]
        ),
        .target(
            name: "SuwayomiKit",
            dependencies: [
                .target(name: "API"),
                .product(name: "Apollo", package: "apollo-ios"),
            ]
        ),
        .testTarget(
            name: "SuwayomiKitTests",
            dependencies: [
                .target(name: "API"),
                .target(name: "SuwayomiKit"),
                .product(name: "Apollo", package: "apollo-ios"),
                .product(name: "ApolloAPI", package: "apollo-ios"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
