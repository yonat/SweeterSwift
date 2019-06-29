//
//  CodableTests.swift
//  swiftlint:disable numbers_smell
//
//  Created by Yonat Sharon on 2019-06-29.
//  Copyright © 2019 Yonat Sharon. All rights reserved.
//

import SweeterSwift
import XCTest

struct CodableTestStruct: Codable {
    var number: Int
    var string: String
    var flag: Bool
}

class CodableTests: XCTestCase {
    let testStruct = CodableTestStruct(number: 42, string: "How many roads", flag: true)
    let testDictionary: [String: Any] = [
        "number": 42,
        "string": "How many roads",
        "flag": true,
    ]

    func testInitFromDictionary() {
        let structFromDictionary = CodableTestStruct(from: testDictionary)
        XCTAssertNotNil(structFromDictionary)
        XCTAssertEqual(structFromDictionary?.number, 42)
        XCTAssertEqual(structFromDictionary?.string, "How many roads")
        XCTAssertEqual(structFromDictionary?.flag, true)
    }

    func testSaveToDictionary() {
        let dictionaryFromStruct = testStruct.dictionary
        XCTAssertNotNil(dictionaryFromStruct)
        XCTAssertEqual(dictionaryFromStruct?["number"] as? Int, 42)
        XCTAssertEqual(dictionaryFromStruct?["string"] as? String, "How many roads")
        XCTAssertEqual(dictionaryFromStruct?["flag"] as? Bool, true)
    }
}
