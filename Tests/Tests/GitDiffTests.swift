//
//  File.swift
//  
//
//  Created by Aaron Vegh on 2023-02-10.
//

import XCTest
import GitDiffSwift

class GitDiffTests: XCTestCase {

    func loadResource(_ filename: String) -> String? {
        guard let fileURL = Bundle.module.url(forResource: filename, withExtension: "diff") else { return nil }
        return try? String(contentsOf: fileURL)
    }

    func testFileMod() {
        guard let subject = loadResource("file_mod") else { XCTFail(); return }

        let parser = DiffParser(input: subject)
        let diffs = parser.parseDiffedFiles()
        XCTAssert(diffs.count > 0)
        print(diffs)
    }

    func testDeletedFile() {
        guard let subject = loadResource("deleted_file_mode") else { XCTFail(); return }

        let parser = DiffParser(input: subject)
        let diffs = parser.parseDiffedFiles()
        let diff = diffs.first

        XCTAssert(diff?.previousFilePath == "Sources/Layout/MessagesCollectionViewFlowLayout+Avatar.swift")
        XCTAssert(diff?.updatedFilePath == "/dev/null")
        print(diffs)
    }

    func testRenamedFile() {
        guard let subject = loadResource("renamed_file_mode") else { XCTFail(); return }

        let parser = DiffParser(input: subject)
        let diffs = parser.parseDiffedFiles()
        XCTAssert(diffs.count > 0)

        print(diffs)
    }

    func testNewFile() {
        guard let subject = loadResource("new_file_mode") else { XCTFail(); return }

        let parser = DiffParser(input: subject)
        let diffs = parser.parseDiffedFiles()
        XCTAssert(diffs.count > 0)

        print(diffs)
    }

}
