//
//  StringTests.swift
//  swiftlint:disable numbers_smell
//
//  Created by Yonat Sharon on 2019-06-29.
//  Copyright © 2019 Yonat Sharon. All rights reserved.
//

import SweeterSwift
import XCTest

class StringTests: XCTestCase {
    func testUnCamelCase() {
        XCTAssertEqual("winterIsComing".unCamelCased, "Winter Is Coming")
        XCTAssertEqual("winterIsComing".camelToSnakeCased, "winter_is_coming")
    }
}
