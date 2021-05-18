//
//  UIViewController+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import UIKit

public extension UIViewController {
    /// Sweeter: Add child view controller pinned to specific places.
    /// Example: addConstrainedChild(pages, constrain: .bottomMargin, .top, .left, .right)
    func addConstrainedChild(_ viewController: UIViewController, constrain: NSLayoutConstraint.Attribute...) {
        addChild(viewController)
        view.addConstrainedSubview(viewController.view, constrainedAttributes: constrain)
        viewController.didMove(toParent: self)
    }
}
