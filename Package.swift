// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Extension",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Extension",
            targets: ["Extension"]),
    ],
  
    // 21.09.23 release 기준
    dependencies: [
      .package(url:"https://github.com/devxoul/Then", from: "2.7.0"),
      .package(url: "https://github.com/ReactiveX/RxSwift", from: "6.2.0"),
      .package(url: "https://github.com/Alamofire/Alamofire", from: "5.4.4"),
      .package(url: "https://github.com/Moya/Moya", from: "15.0.0"),
      .package(url: "https://github.com/devxoul/MoyaSugar", from: "1.3.3"),
      .package(url: "https://github.com/SnapKit/SnapKit", from: "5.0.1"),
      .package(url: "https://github.com/ReactorKit/ReactorKit", from: "3.0.0"),
      .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", from: "4.2.2"),
      .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver", from: "1.9.5"),
      
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Extension",
            dependencies: []),
        .testTarget(
            name: "ExtensionTests",
            dependencies: ["Extension"]),
    ]
)
