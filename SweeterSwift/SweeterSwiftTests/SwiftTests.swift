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
            lazy var fooRef = weak(self, in: Foo.foo)

            required init() {
                fooRef()
                Foo.refCount += 1
            }

            deinit {
                Foo.refCount -= 1
            }
        }

        for _ in 0 ..< 3 {
            let aFoo = Foo()
            aFoo.foo()
            XCTAssertEqual(Foo.refCount, 1)
        }

        XCTAssertEqual(Foo.refCount, 0)
    }
}
