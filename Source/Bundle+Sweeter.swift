//
//  Bundle+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import Foundation

public extension Bundle {
    /// Sweeter: app name with reasonable fallback to process name
    var name: String {
        return infoDictionary?["CFBundleDisplayName"] as? String
            ?? infoDictionary?["CFBundleName"] as? String
            ?? ProcessInfo.processInfo.processName
    }

    /// Sweeter: app name, version, and build number
    var infoString: String {
        let version = infoDictionary?["CFBundleShortVersionString"] as? String
        let build = infoDictionary?["CFBundleVersion"] as? String

        let nameAndVersion = [name, version].compact.joined(separator: " ")
        return [nameAndVersion, build].compact.joined(separator: " #")
    }
}
