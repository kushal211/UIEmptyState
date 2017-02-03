//
//  UIEmptyStateDelegate.swift
//  UIEmptyState
//
//  Created by Luis Padron on 1/31/17.
//  Copyright © 2017 Luis Padron. All rights reserved.
//

/// The delegate for UIEmptyStateView
///
/// **Important:** this delegate and its functions are only used when using UIEmptyStateView.
/// If you will provide a custome view in the UIEmptyStateDataSource you must handle how this delegate operates
public protocol UIEmptyStateDelegate: class {
    /// The call back for when the button inside the emptyStateView is tapped
    ///
    /// - parameters:
    ///     - button: The button that was tapped
    func emptyStatebuttonWasTapped(button: UIButton)
    
    /// The call back for when the emptyStateView itself is tapped
    ///
    /// - parameters:
    ///     - view: The view that was tapped
    func emptyStateViewWasTapped(view: UIView)
}

/// Extension to add default conformance to UITableViewController, by default the method bodies are empty
extension UIEmptyStateDelegate where Self: UITableViewController {
    public func emptyStatebuttonWasTapped(button: UIButton) { }
    public func emptyStateViewWasTapped(view: UIView) { }
}
