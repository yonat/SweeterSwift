//
//  CodableTests.swift
//  swiftlint:disable no_magic_numbers
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
    var optionalFloat: Float?
}

class CodableTests: XCTestCase {
    let testStruct = CodableTestStruct(number: 42, string: "How many roads", flag: true)
    let testDictionary: [String: Any] = [
        "number": 42,
        "string": "How many roads",
        "flag": true,
    ]

    func testInitFromDictionary() throws {
        let structFromDictionary = try XCTUnwrap(CodableTestStruct(dictionary: testDictionary))
        XCTAssertEqual(structFromDictionary.number, 42)
        XCTAssertEqual(structFromDictionary.string, "How many roads")
        XCTAssertEqual(structFromDictionary.flag, true)
        XCTAssertNil(structFromDictionary.optionalFloat)
    }

    func testSaveToDictionary() throws {
        let dictionaryFromStruct = try XCTUnwrap(testStruct.dictionary)
        XCTAssertEqual(dictionaryFromStruct["number"] as? Int, 42)
        XCTAssertEqual(dictionaryFromStruct["string"] as? String, "How many roads")
        XCTAssertEqual(dictionaryFromStruct["flag"] as? Bool, true)
        XCTAssertNil(dictionaryFromStruct["optionalFloat"])
    }

    func testCodableNameConflict() throws {
        let testDecodableStruct = TestDecodableStruct(dictionary: ["number": 1, "string": "Sweeter"])
        XCTAssertEqual(testDecodableStruct?.number, 42)
        XCTAssertEqual(testDecodableStruct?.string, "Override Sweeter init")
    }
}

struct TestDecodableStruct {
    var number: Int
    var string: String
}

extension TestDecodableStruct: Decodable {}

extension TestDecodableStruct {
    init?(dictionary: [String: Any]) {
        self.init(number: 42, string: "Override Sweeter init")
    }
}
