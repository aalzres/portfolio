// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CakeList",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CakeList",
            targets: ["CakeList"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Action", path: "../Action"),
        .package(name: "Architecture", path: "../Architecture"),
        .package(name: "UserInterface", path: "../UserInterface"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("6.2.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CakeList",
            dependencies: [
                "Action",
                "Architecture",
                "UserInterface",
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift"),
            ]
        ),
        .testTarget(
            name: "CakeListTests",
            dependencies: ["CakeList"]),
    ],
    swiftLanguageVersions: [.v5]
)
