//
//  UIViewController+Extension.swift
//  Navigation-Full-Fleged
//
//  Created by Vasu Chovatiya on 05/03/25.
//

import UIKit

extension UIViewController {
    
    /// Returns the storyboard ID based on the class name
    /// Can be overridden in subclasses if needed
    class var storyboardID: String {
        return String(describing: self)
    }

    /// Instantiates a view controller from the specified AppStoryboard
    static func instantiate(fromAppStoryboard storyboard: StoryBoard) -> Self {
        return storyboard.viewController(viewControllerClass: self)
    }
    
    /// Safer method to instantiate view controllers with an optional return type
    static func safeInstantiate(fromAppStoryboard storyboard: StoryBoard) -> Self? {
        return storyboard.initialViewController()
    }

    /// Show an alert with Delete and Cancel options
    func showAlertDeleteCancel(
        title: String,
        message: String,
        deleteTitle: String = "Delete",
        cancelTitle: String = "Cancel",
        completion: @escaping (Bool) -> ()
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: deleteTitle, style: .destructive) { _ in
            completion(true)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    /// Generic alert with multiple actions
    func showAlert(
        title: String,
        message: String,
        actions: [(String, UIAlertAction.Style, (() -> Void)?)],
        preferredStyle: UIAlertController.Style = .alert
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        for (title, style, handler) in actions {
            let action = UIAlertAction(title: title, style: style) { _ in
                handler?()
            }
            alert.addAction(action)
        }
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
