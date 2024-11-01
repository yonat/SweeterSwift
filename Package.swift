// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "SweeterSwift",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(name: "SweeterSwift", targets: ["SweeterSwift"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "SweeterSwift", dependencies: [], path: "Source", resources: [.process("PrivacyInfo.xcprivacy")]),
        .testTarget(name: "SweeterSwiftTests", dependencies: ["SweeterSwift"], path: "SweeterSwift/SweeterSwiftTests"),
    ],
    swiftLanguageVersions: [.v5]
)
