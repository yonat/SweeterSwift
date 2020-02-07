//
//  Swift+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-21.
//

extension CaseIterable where Self: Equatable {
    /// Sweeter: Index of current case in `allCases`.
    public var index: Int {
        let all = Array(Self.allCases)
        return all.firstIndex(of: self)! // swiftlint:disable:this force_unwrapping
    }
}

// from https://gist.github.com/siejkowski/a2b187800f2e28b53c96

extension Sequence where Element: Optionable {
    /// Sweeter: Shorthand for `compactMap { $0 }`.
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

infix operator =?: AssignmentPrecedence

/// Sweeter: Assign iff right side is not nil.
public func =? <T>(lhs: inout T, rhs: T?) {
    if nil != rhs, let rhs = rhs {
        lhs = rhs
    }
}

public protocol DefaultConstructible {
    init()
}

extension Optional: DefaultConstructible {
    public init() {
        self = .none
    }
}

extension IntegerLiteralType: DefaultConstructible {}
extension BooleanLiteralType: DefaultConstructible {}
extension FloatLiteralType: DefaultConstructible {}
extension StringLiteralType: DefaultConstructible {}
extension Array: DefaultConstructible {}
extension Dictionary: DefaultConstructible {}
extension Set: DefaultConstructible {}

// based on https://sveinhal.github.io/2016/03/16/retain-cycles-function-references/

/// Sweeter: Pass a member function as an @escaping closure without retaining its object.
///
///  Example:  `var closure = weak(self, in: MyClass.someFunction)`
public func weak<T: AnyObject>(_ instance: T, in classFunction: @escaping (T) -> () -> Void) -> () -> Void {
    return { [weak instance] in
        guard let instance = instance else { return }
        classFunction(instance)()
    }
}

/// Sweeter: Pass a member function as an @escaping closure without retaining its object.
///
///  Example:  `var closure = weak(self, in: MyClass.someFunction)`
public func weak<T: AnyObject, U>(_ instance: T, in classFunction: @escaping (T) -> (U) -> Void) -> (U) -> Void {
    return { [weak instance] arguments in
        guard let instance = instance else { return }
        classFunction(instance)(arguments)
    }
}

/// Sweeter: Pass a member function as an @escaping closure without retaining its object.
///
///  Example:  `var closure = weak(self, in: MyClass.someFunction)`
public func weak<T: AnyObject, V: DefaultConstructible>(_ instance: T, in classFunction: @escaping (T) -> () -> V) -> () -> V {
    return { [weak instance] in
        guard let instance = instance else { return V() }
        return classFunction(instance)()
    }
}

/// Sweeter: Pass a member function as an @escaping closure without retaining its object.
///
///  Example:  `var closure = weak(self, in: MyClass.someFunction)`
public func weak<T: AnyObject, U, V: DefaultConstructible>(_ instance: T, in classFunction: @escaping (T) -> (U) -> V) -> (U) -> V {
    return { [weak instance] arguments in
        guard let instance = instance else { return V() }
        return classFunction(instance)(arguments)
    }
}
