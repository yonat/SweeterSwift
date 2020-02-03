//
//  SwiftTests.swift
//  swiftlint:disable numbers_smell
//
//  Created by Yonat Sharon on 2019-06-29.
//  Copyright © 2019 Yonat Sharon. All rights reserved.
//

import SweeterSwift
import XCTest

enum SwiftTestEnum: CaseIterable {
    case first, second, third, fourth, fifth, sixth
}

class SwiftTests: XCTestCase {
    func testEnumIndex() {
        XCTAssertEqual(SwiftTestEnum.first.index, 0)
        XCTAssertEqual(SwiftTestEnum.third.index, 2)
        XCTAssertEqual(SwiftTestEnum.sixth.index, 5)
    }

    func testCompactSequence() {
        let arrayOfOptionals: [Int?] = [0, 1, nil, 2, nil, nil, 3]
        XCTAssertEqual(arrayOfOptionals.compact, [0, 1, 2, 3])
    }

    func testWeakSelfInMemberFunction() {
        class Foo: DefaultConstructible {
            static var refCount = 0

            func foo() {}
            func fooWithParam(n: Int) {}
            func fooWithReturn() -> String { "" }
            func fooWithParamAndReturn(array: [Character]) -> Double { 0 }

            lazy var fooRef = weak(self, in: Foo.foo)
            lazy var fooWithParamRef = weak(self, in: Foo.fooWithParam)
            lazy var fooWithReturnRef = weak(self, in: Foo.fooWithReturn)
            lazy var fooWithParamAndReturnRef = weak(self, in: Foo.fooWithParamAndReturn)

            required init() {
                fooRef()
                fooWithParamRef(7)
                _ = fooWithReturn()
                _ = fooWithParamAndReturnRef([])
                Foo.refCount += 1
            }

            deinit {
                Foo.refCount -= 1
            }
        }

        XCTAssertEqual(Foo.refCount, 0)

        for _ in 0 ..< 3 {
            let aFoo = Foo()
            aFoo.foo()
            XCTAssertEqual(Foo.refCount, 1)
        }

        XCTAssertEqual(Foo.refCount, 0)
    }
}
