// swift-tools-version:5.1.

import PackageDescription

let package = Package(
    name: "SweeterSwift",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library( name: "SweeterSwift", targets: ["SweeterSwift"])
    ],
    dependencies: [],
    targets: [
        .target(name: "SweeterSwift", dependencies: [], path: "Source")
    ],
    swiftLanguageVersions: [.v5]
)
