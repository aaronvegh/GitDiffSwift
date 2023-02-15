//
//  GitDiff.swift
//  GitDiffSwift
//
//  Created by Steven Deutsch on 4/1/18.
//  Copyright © 2018 GitDiffSwift. All rights reserved.
//

import Foundation

public struct GitDiff: Codable {

    public enum DiffType: String, Codable {
        case newFile
        case deleteFile
        case renameFile
        case `default`
    }

    public var previousFilePath: String

    public var updatedFilePath: String

    public var diffType: DiffType = .default

    public var index: GitIndex?

    public var hunks: [GitHunk]

    internal var description: String {
        let prefix = "diff --git"
        let fileA = "a/" + previousFilePath
        let fileB = "b/" + updatedFilePath
        let diffHeader = prefix + " " + fileA + " " + fileB
        let old = "--- " + fileA
        let new = "+++ " + fileB
        let headerContent = diffHeader + "\n" + (index?.description ?? "noindex") + "\n" + old + "\n" + new
        var body = headerContent
        for hunk in hunks {
            body += "\n"
            body += hunk.description
        }
        return body
    }
}
