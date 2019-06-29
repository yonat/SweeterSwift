//
//  Swift+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-21.
//

extension CaseIterable where Self: Equatable {
    /// SweeterSwift: Index of current case in `allCases`.
    public var index: Int {
        let all = Array(Self.allCases)
        return all.firstIndex(of: self)! // swiftlint:disable:this force_unwrapping
    }
}

// from https://gist.github.com/siejkowski/a2b187800f2e28b53c96

extension Sequence where Element: Optionable {
    /// SweeterSwift: Shorthand for `compactMap { $0 }`.
    public var compact: [Element.Wrapped] {
        return compactMap { $0.value }
    }
}

public protocol Optionable {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

// extension for Optional provides the implementations for Optional enum
extension Optional: Optionable {
    public var value: Wrapped? { return self }
}
