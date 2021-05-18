//
//  TimeInterval+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import Foundation

public extension TimeInterval {
    static let minute: TimeInterval = 60
    static let hour: TimeInterval = 60 * minute
    static let day: TimeInterval = 24 * hour
    static let week: TimeInterval = 7 * day
    static let year: TimeInterval = 365.25 * day
    static let month: TimeInterval = year / 12
}
