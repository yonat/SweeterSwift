//
//  TimeInterval+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import Foundation

extension TimeInterval {
    public static let minute: TimeInterval = 60
    public static let hour: TimeInterval = 60 * minute
    public static let day: TimeInterval = 24 * hour
    public static let week: TimeInterval = 7 * day
    public static let year: TimeInterval = 365.25 * day
    public static let month: TimeInterval = year / 12
}
