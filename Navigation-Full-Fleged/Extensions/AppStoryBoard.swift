//
//  AppStoryBoard.swift
//  Navigation-Full-Fleged
//
//  Created by Vasu Chovatiya on 05/03/25.
//

import Foundation
import UIKit

public enum StoryBoard: String {
    
    case Main
    
    

    public var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    /// Generic method to instantiate ViewControllers safely
    public func viewController<T: UIViewController>(viewControllerClass: T.Type, function: String = #function, line: Int = #line, file: String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            assertionFailure("❌ ViewController with identifier \(storyboardID) not found in \(self.rawValue) Storyboard.\nFile: \(file) \nLine: \(line) \nFunction: \(function)")
            return T() // Return an empty instance in release mode to prevent crashes
        }
        return scene
    }
    
    /// Returns the Initial ViewController of the Storyboard
    public func initialViewController<T: UIViewController>() -> T? {
        return instance.instantiateInitialViewController() as? T
    }
}
