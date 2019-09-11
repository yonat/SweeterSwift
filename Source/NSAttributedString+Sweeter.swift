//
//  NSAttributedString+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import Foundation

extension NSAttributedString {
    /// Sweeter: Create attributed string from HTML
    public convenience init?(htmlString: String, defaultAttributes: [NSAttributedString.Key: Any]? = nil) {
        guard let data = htmlString.data(using: .utf8) else { return nil }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue,
            .defaultAttributes: defaultAttributes ?? [:],
        ]

        try? self.init(data: data, options: options, documentAttributes: nil)
    }
}

extension NSMutableAttributedString {
    /// Sweeter: Make part of the string into a link.
    ///
    /// - Parameters:
    ///   - url: link address.
    ///   - anchorText: substring to make into a link.
    public func link(anchorText: String, url: String) {
        guard let urlObject = URL(string: url) else { return }
        let anchorRange = mutableString.range(of: anchorText, options: [.caseInsensitive, .diacriticInsensitive, .widthInsensitive])
        guard NSNotFound != anchorRange.location else { return }
        addAttribute(.link, value: urlObject, range: anchorRange)
    }
}
