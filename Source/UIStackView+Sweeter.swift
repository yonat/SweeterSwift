//
//  UIStackView+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import UIKit

public extension UIStackView {
    /// Sweeter: Remove `subview` from the view hierarchy, not just the stack arrangement.
    func removeArrangedSubviewCompletely(_ subview: UIView) {
        removeArrangedSubview(subview)
        subview.removeFromSuperview()
    }

    /// Sweeter: Remove all arranged subviews from the view hierarchy, not just the stack arrangement.
    func removeAllArrangedSubviewsCompletely() {
        for subview in arrangedSubviews.reversed() {
            removeArrangedSubviewCompletely(subview)
        }
    }
}
