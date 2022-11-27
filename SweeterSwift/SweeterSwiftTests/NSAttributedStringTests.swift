//
//  NSAttributedStringTests.swift
//  swiftlint:disable no_magic_numbers
//
//  Created by Yonat Sharon on 2019-06-29.
//  Copyright © 2019 Yonat Sharon. All rights reserved.
//

import SweeterSwift
import XCTest

class NSAttributedStringTests: XCTestCase {
    func testInitFromHTML() {
        let stringFromHTML = NSAttributedString(htmlString: "Text with <b>bold</b> and <i>italic</i> parts.")
        XCTAssertEqual(stringFromHTML?.string, "Text with bold and italic parts.")
        XCTAssertTrue(stringFromHTML?.traits(at: 12)?.contains(.traitBold) ?? false)
        XCTAssertTrue(stringFromHTML?.traits(at: 24)?.contains(.traitItalic) ?? false)
    }

    func testLinkAnchorTextToURL() {
        let stringWithAnchor = NSMutableAttributedString(string: "Text with anchor text to link")
        stringWithAnchor.link(anchorText: "anchor text", url: "https://ootips.org")
        XCTAssertNotNil(stringWithAnchor.attributes(at: 12, effectiveRange: nil)[.link])
    }
}

extension NSAttributedString {
    func traits(at index: Int) -> UIFontDescriptor.SymbolicTraits? {
        return (attributes(at: index, effectiveRange: nil)[.font] as? UIFont)?.fontDescriptor.symbolicTraits
    }
}
