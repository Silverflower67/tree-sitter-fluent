// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterFluent",
    products: [
        .library(name: "TreeSitterFluent", targets: ["TreeSitterFluent"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterFluent",
            dependencies: [],
            path: ".",
            sources: [
                "src/parser.c",
                // NOTE: if your language has an external scanner, add it here.
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterFluentTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterFluent",
            ],
            path: "bindings/swift/TreeSitterFluentTests"
        )
    ],
    cLanguageStandard: .c11
)
