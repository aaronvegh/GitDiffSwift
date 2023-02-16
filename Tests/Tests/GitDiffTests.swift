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

    func testDeletedFile() {
        guard let subject = loadResource("delete_file") else { XCTFail(); return }

        let parser = DiffParser(input: subject)
        let diffs = parser.parseDiffedFiles()
        let diff = diffs.first

        XCTAssert(diff?.diffType == .deleteFile)
        XCTAssert(diff?.previousFilePath == "--2--Part 2/--1--Chapter 5")
        XCTAssert(diff?.updatedFilePath == "/dev/null")
        print(diffs)
    }

    func testFileMod() {
        guard let subject = loadResource("file_mod") else { XCTFail(); return }

        let parser = DiffParser(input: subject)
        let diffs = parser.parseDiffedFiles()
        let diff = diffs.first

        XCTAssert(diff?.diffType == .default)
        print(diffs)
    }

    func testRenamedFile() {
        guard let subject = loadResource("rename_file") else { XCTFail(); return }

        let parser = DiffParser(input: subject)
        let diffs = parser.parseDiffedFiles()
        let firstDiff = diffs.first

        XCTAssert(firstDiff?.diffType == .renameFile)

        print(diffs)
    }

    func testNewFile() {
        guard let subject = loadResource("new_file") else { XCTFail(); return }

        let parser = DiffParser(input: subject)
        let diffs = parser.parseDiffedFiles()
        let diff = diffs.first

        XCTAssert(diff?.diffType == .newFile)

        print(diffs)
    }

    func testMultipleModeFile() {
        guard let subject = loadResource("multi_diff_add_delete") else { XCTFail(); return }

        let parser = DiffParser(input: subject)
        let diffs = parser.parseDiffedFiles()
        let addDiff = diffs[0]
        let deleteDiff = diffs[1]

        XCTAssertNotNil(addDiff)
        XCTAssertNotNil(deleteDiff)

    }

}
