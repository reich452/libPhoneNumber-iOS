// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "libPhoneNumber",
    platforms: [
        .macOS(.v11_5),
        .macCatalyst(.v13),
        .iOS(.v13),
        .tvOS(.v12),
        .watchOS(.v5)
    ],
    products: [
        .library(
            name: "libPhoneNumber",
            targets: ["libPhoneNumber"]
        )
    ],
    targets: [
        .target(
            name: "libPhoneNumber",
            path: "libPhoneNumber",
            exclude: ["GeneratePhoneNumberHeader.sh", "Info.plist"],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("Internal")
            ],
            linkerSettings: [
                .linkedFramework("Contacts", .when(platforms: [.iOS, .macOS, .macCatalyst, .watchOS])),
            ]
        ),
        .testTarget(
            name: "libPhoneNumberTests",
            dependencies: ["libPhoneNumber"],
            path: "libPhoneNumberTests",
            sources: [
                "NBAsYouTypeFormatterTest.m",
                "NBPhoneNumberParsingPerfTest.m",
                "NBPhoneNumberUtilTest.m",
            ]
        )
    ]
)
