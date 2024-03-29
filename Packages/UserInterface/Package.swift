// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserInterface",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "UserInterface",
            targets: ["UserInterface"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Architecture", path: "../Architecture"),
        .package(name: "Utilities", path: "../Utilities"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "UserInterface",
            dependencies: [
                "Architecture",
                "Utilities",
                "SnapKit"
            ]),
        .testTarget(
            name: "UserInterfaceTests",
            dependencies: ["UserInterface"]),
    ],
    swiftLanguageVersions: [.v5]
)
