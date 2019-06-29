//
//  UIStackView+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import UIKit

extension UIStackView {
    /// SweeterSwift: Remove `subview` from the view hierarchy, not just the stack arrangement.
    public func removeArrangedSubviewCompletely(_ subview: UIView) {
        removeArrangedSubview(subview)
        subview.removeFromSuperview()
    }

    /// SweeterSwift: Remove all arranged subviews from the view hierarchy, not just the stack arrangement.
    public func removeAllArrangedSubviewsCompletely() {
        for subview in arrangedSubviews.reversed() {
            removeArrangedSubviewCompletely(subview)
        }
    }
}
