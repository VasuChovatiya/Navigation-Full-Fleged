//
//  UINavigationController+Extension.swift
//  Navigation-Full-Fleged
//
//  Created by Vasu Chovatiya on 05/03/25.
//

import Foundation
import UIKit

extension UINavigationController {
    
    /// Pushes a view controller with optional animation and completion handler
    func pushViewController(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        self.pushViewController(viewController, animated: animated)
        guard animated, let transitionCoordinator = self.transitionCoordinator else {
            DispatchQueue.main.async { completion?() }
            return
        }
        transitionCoordinator.animate(alongsideTransition: nil) { _ in completion?() }
    }
    
    /// Pops the top view controller with optional animation and completion handler
    func popViewController(animated: Bool = true, completion: (() -> Void)? = nil) {
        self.popViewController(animated: animated)
        guard animated, let transitionCoordinator = self.transitionCoordinator else {
            DispatchQueue.main.async { completion?() }
            return
        }
        transitionCoordinator.animate(alongsideTransition: nil) { _ in completion?() }
    }
    
    /// Pops to the root view controller with optional animation and completion handler
    func popToRootViewController(animated: Bool = true, completion: (() -> Void)? = nil) {
        self.popToRootViewController(animated: animated)
        guard animated, let transitionCoordinator = self.transitionCoordinator else {
            DispatchQueue.main.async { completion?() }
            return
        }
        transitionCoordinator.animate(alongsideTransition: nil) { _ in completion?() }
    }
    
    /// Pops to a specific view controller in the stack if it exists
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = self.viewControllers.first(where: { $0.isKind(of: ofClass) }) {
            self.popToViewController(vc, animated: animated)
        }
    }
    
    /// Replaces the root view controller of the navigation stack
    func setRootViewController(_ viewController: UIViewController, animated: Bool = true) {
        self.setViewControllers([viewController], animated: animated)
    }
    
    /// Dismisses the navigation controller when it's presented modally
    func dismissNavigation(animated: Bool = true, completion: (() -> Void)? = nil) {
        self.dismiss(animated: animated, completion: completion)
    }
}
