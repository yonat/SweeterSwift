//
//  String+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import Foundation

extension String {
    /// Sweeter: Separate CamelCase into capitalized words.
    /// E.g., "winterIsComing" -> "Winter Is Coming"
    public var unCamelCased: String {
        return replacingCamelCase(with: "$1 $2").capitalized
    }

    /// Sweeter: Change CamelCase into snake_case
    /// E.g., "winterIsComing" -> "winter_is_coming"
    public var camelToSnakeCased: String {
        return replacingCamelCase(with: "$1_$2").lowercased()
    }

    func replacingCamelCase(with template: String) -> String {
        return String.camelCaseWordBoundaryRegex
            .stringByReplacingMatches(in: self, range: NSRange(startIndex..., in: self), withTemplate: template)
    }

    static let camelCaseWordBoundaryRegex: NSRegularExpression = {
        do {
            return try NSRegularExpression(pattern: "([a-z])([A-Z])")
        } catch {
            fatalError(error.localizedDescription)
        }
    }()
}
