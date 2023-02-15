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
                    .copy("Resources/delete_file.diff"),
                    .copy("Resources/file_mod.diff"),
                    .copy("Resources/multi_diff_add_delete.diff"),
                    .copy("Resources/new_file.diff"),
                    .copy("Resources/rename_file.diff")
                  ]),
   ]
)
