// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DomainMock",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DomainMock",
            targets: ["DomainMock"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Domain", path: "../Domain"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DomainMock",
            dependencies: [
                "Domain",
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift"),
            ]
        ),
        .testTarget(
            name: "DomainMockTests",
            dependencies: ["DomainMock"]),
    ],
    swiftLanguageVersions: [.v5]
)
