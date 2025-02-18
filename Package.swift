// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GeoJSONSwiftHelper",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "GeoJSONSwiftHelper",
      targets: ["GeoJSONSwiftHelper"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    .package(url: "https://github.com/mapbox/turf-swift.git", .upToNextMajor(from: "3.0.0")),
    .package(url: "https://github.com/GEOSwift/GEOSwift.git", .upToNextMajor(from: "11.0.0"))
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "GeoJSONSwiftHelper",
      dependencies: [
        .product(name: "Turf", package: "turf-swift"),
        .product(name: "GEOSwift", package: "GEOSwift")
      ]),
    .testTarget(
      name: "GeoJSONSwiftHelperTests",
      dependencies: ["GeoJSONSwiftHelper",
                     .product(name: "Turf", package: "turf-swift"),
                     .product(name: "GEOSwift", package: "GEOSwift")
      ]),
  ]
)
