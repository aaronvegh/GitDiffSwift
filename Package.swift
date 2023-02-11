// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
   name: "GitDiffSwift",
   products: [
      .library(name: "GitDiffSwift", targets: ["GitDiffSwift"])
   ],
   dependencies: [ ],
   targets: [
      .target(name: "GitDiffSwift", dependencies: [], path: "Sources"),
      .testTarget(name: "Tests",
                  dependencies: ["GitDiffSwift"],
                  resources: [
                    .copy("Resources/deleted_file_mode.diff"),
                    .copy("Resources/multi_file_change.diff"),
                    .copy("Resources/new_file_mode.diff"),
                    .copy("Resources/no_new_line.diff"),
                    .copy("Resources/renamed_file_mode.diff"),
                    .copy("Resources/file_mod.diff")
                  ]),
   ]
)
