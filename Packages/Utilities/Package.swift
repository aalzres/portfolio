// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Utilities",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Utilities",
            targets: ["Utilities"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "git@github.com:aalzres/SwifterSwift.git", from: "5.2.0"),
        .package(url: "https://github.com/RxSwiftCommunity/RxGesture.git", from: "4.0.4"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Utilities",
            dependencies: [
                "SwifterSwift",
                "RxSwift",
                "RxGesture",
                .product(name: "RxCocoa", package: "RxSwift"),
            ]
        ),
        .testTarget(
            name: "UtilitiesTests",
            dependencies: ["Utilities"]),
    ],
    swiftLanguageVersions: [.v5]
)
