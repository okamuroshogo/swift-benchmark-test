import PackageDescription

let package = Package(
    name: "swift",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 5),
        .Package(url: "https://github.com/vapor/mysql-provider.git", majorVersion: 1, minor: 1)  // 追加
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)

