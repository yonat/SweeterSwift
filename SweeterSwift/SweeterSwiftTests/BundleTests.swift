//
//  BundleTests.swift
//  swiftlint:disable numbers_smell
//
//  Created by Yonat Sharon on 2019-06-29.
//  Copyright © 2019 Yonat Sharon. All rights reserved.
//

import SweeterSwift
import XCTest

class BundleTests: XCTestCase {
    func testBundle() {
        XCTAssertEqual(Bundle.main.name, "xctest")
        XCTAssertTrue(Bundle.main.infoString.contains(" "))
    }
}
