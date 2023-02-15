//
//  NSRegularExpression+Match.swift
//  
//
//  Created by Aaron Vegh on 2023-02-15.
//

import Cocoa

extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
    
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }

    func firstMatch(_ string: String) -> String? {
        let results = matches(in: string, range: NSRange(string.startIndex..., in: string))
        return results.map {
            String(string[Range($0.range, in: string)!])
        }.first
    }
}
