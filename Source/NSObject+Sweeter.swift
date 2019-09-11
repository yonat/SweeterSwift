//
//  NSObject+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import Foundation

extension NSObject {
    /// Sweeter: Post a local notification using `NotificationCenter.default`.
    public func notify(_ notificationName: Notification.Name, userInfo: [AnyHashable: Any]? = nil) {
        NotificationCenter.default.post(name: notificationName, object: self, userInfo: userInfo)
    }

    /// Sweeter: Respond to a local notification from `NotificationCenter.default`.
    public func observeNotification(name: Notification.Name, selector: Selector, object: Any? = nil) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: object)
    }
}
