//
//  Codable+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import Foundation

public extension Decodable {
    /// Sweeter: Create object from a dictionary
    init?(dictionary: [String: Any]) {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted) else { return nil }
        guard let decodedSelf = try? JSONDecoder().decode(Self.self, from: data) else { return nil }
        self = decodedSelf
    }
}

public extension Encodable {
    /// Sweeter: Export object to a dictionary representation
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
