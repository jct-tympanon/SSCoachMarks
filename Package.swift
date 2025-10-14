// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SSCoachMarks",
    platforms: [.iOS(.v17), .macOS(.v10_15)],
    products: [
        .library(
            name: "SSCoachMarks",
            targets: ["SSCoachMarks"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SSCoachMarks",
            path: "Sources"
        )
    ],
    swiftLanguageVersions: [.v5]
)
