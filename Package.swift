// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Keycard",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Keycard",
            targets: ["Keycard"]),
    ],
    dependencies: [
        .package(name: "secp256k1", url: "https://github.com/GigaBitcoin/secp256k1.swift", .upToNextMinor(from: "0.10.0")),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMinor(from: "1.6.0")),
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.3.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Keycard",
            dependencies: ["secp256k1", "CryptoSwift", "BigInt"],
            swiftSettings: [.define("USE_SPM")]),
        .testTarget(
            name: "KeycardTests",
            dependencies: ["Keycard"]),
    ]
)
