// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Statistic",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Statistic",
            targets: ["Statistic"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Architecture", path: "../Architecture"),
        .package(name: "UserInterface", path: "../UserInterface"),
        .package(name: "Utilities", path: "../Utilities"),
        .package(url: "https://github.com/RxSwiftCommunity/RxGesture.git", from: "4.0.4"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "10.0.0"),
        .package(url: "https://github.com/Quick/Quick.git", from: "5.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Statistic",
            dependencies: [
                "Architecture",
                "UserInterface",
                "Utilities",
                "RxSwift",
                "RxGesture",
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxBlocking", package: "RxSwift"),
            ]),
        .testTarget(
            name: "StatisticTests",
            dependencies: [
                "Statistic",
                "Quick",
                "Nimble"
            ]),
    ],
    swiftLanguageVersions: [.v5]
)
