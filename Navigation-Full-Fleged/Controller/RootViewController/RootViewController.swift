//
//  RootViewController.swift
//  Navigation-Full-Fleged
//
//  Created by Vasu Chovatiya on 05/03/25.
//

import UIKit

class RootViewController: UIViewController {
    
    var splashViewController: SplashViewController?


    override func viewDidLoad() {
        super.viewDidLoad()
        showSplashScreen()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.goToHome()
        }
    }
    
    
    private func showSplashScreen() {
        let splashViewController = SplashViewController.instantiate(fromAppStoryboard: .Main)
        self.splashViewController = splashViewController
        splashViewController.willMove(toParent: self)
        addChild(splashViewController)
        view.addSubview(splashViewController.view)
        splashViewController.didMove(toParent: self)
    }
    
    //MARK: - Zoom-In Animation
    
//    func goToHome() {
//        UIView.animate(withDuration: 0.5, animations: {
//            self.splashViewController?.view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2) // Zoom Out Effect
//            self.splashViewController?.view.alpha = 0 // Fade Out
//        }) { _ in
//            self.splashViewController?.willMove(toParent: nil)
//            self.splashViewController?.view.removeFromSuperview()
//            self.splashViewController?.removeFromParent()
//            
//            let homeNavVC = StoryBoard.Main.instance.instantiateViewController(withIdentifier: "HomeNavVC") as! UINavigationController
//            homeNavVC.view.alpha = 0
//            self.addChild(homeNavVC)
//            self.view.addSubview(homeNavVC.view)
//
//            UIView.animate(withDuration: 0.5, animations: {
//                homeNavVC.view.alpha = 1
//            }) { _ in
//                homeNavVC.didMove(toParent: self)
//            }
//        }
//    }

    
    //MARK: - Zoom-Out Animation (Screen Shrinks)
//
//    func goToHome() {
//        UIView.animate(withDuration: 0.5, animations: {
//            self.splashViewController?.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8) // Shrink Effect
//            self.splashViewController?.view.alpha = 0
//        }) { _ in
//            self.splashViewController?.willMove(toParent: nil)
//            self.splashViewController?.view.removeFromSuperview()
//            self.splashViewController?.removeFromParent()
//
//            let homeNavVC = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "HomeNavVC") as! UINavigationController
//            self.addChild(homeNavVC)
//            self.view.addSubview(homeNavVC.view)
//            
//            homeNavVC.view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2) // Start Bigger
//            homeNavVC.view.alpha = 0
//
//            UIView.animate(withDuration: 0.5, animations: {
//                homeNavVC.view.transform = .identity // Return to Normal Size
//                homeNavVC.view.alpha = 1
//            }) { _ in
//                homeNavVC.didMove(toParent: self)
//            }
//        }
//    }


    //MARK: - Rotate & Fade Transition
//    func goToHome() {
//        UIView.animate(withDuration: 0.5, animations: {
//            self.splashViewController?.view.transform = CGAffineTransform(rotationAngle: .pi) // Rotate 180 Degrees
//            self.splashViewController?.view.alpha = 0
//        }) { _ in
//            self.splashViewController?.willMove(toParent: nil)
//            self.splashViewController?.view.removeFromSuperview()
//            self.splashViewController?.removeFromParent()
//            
//            let homeNavVC = StoryBoard.Main.instance.instantiateViewController(withIdentifier: "HomeNavVC") as! UINavigationController
//            self.addChild(homeNavVC)
//            self.view.addSubview(homeNavVC.view)
//
//            homeNavVC.view.alpha = 0
//            UIView.animate(withDuration: 0.5, animations: {
//                homeNavVC.view.alpha = 1
//            }) { _ in
//                homeNavVC.didMove(toParent: self)
//            }
//        }
//    }
    
    //MARK: - Slide Transition Animation
//    func goToHome() {
//        let homeNavVC = StoryBoard.Main.instance.instantiateViewController(withIdentifier: "HomeNavVC") as! UINavigationController
//        addChild(homeNavVC)
//
//        let width = self.view.bounds.width
//        homeNavVC.view.frame = CGRect(x: width, y: 0, width: width, height: self.view.bounds.height)
//        view.addSubview(homeNavVC.view)
//
//        UIView.animate(withDuration: 0.5, animations: {
//            homeNavVC.view.frame = self.view.bounds
//        }) { _ in
//            homeNavVC.didMove(toParent: self)
//            self.splashViewController?.willMove(toParent: nil)
//            self.splashViewController?.view.removeFromSuperview()
//            self.splashViewController?.removeFromParent()
//        }
//    }
    
    //MARK: -
    func goToHome() {
        // Remove the splash screen with fade-out animation
        UIView.animate(withDuration: 0.5, animations: {
            self.splashViewController?.view.alpha = 0
        }) { _ in
            self.splashViewController?.willMove(toParent: nil)
            self.splashViewController?.view.removeFromSuperview()
            self.splashViewController?.removeFromParent()
            self.splashViewController = nil
            
            // Load the Home Screen inside a navigation controller
            let homeNavVC = StoryBoard.Main.instance.instantiateViewController(withIdentifier: "HomeNavVC") as! UINavigationController

            // Smooth transition effect
            homeNavVC.view.alpha = 0
            self.addChild(homeNavVC)
            self.view.addSubview(homeNavVC.view)

            UIView.animate(withDuration: 0.5, animations: {
                homeNavVC.view.alpha = 1
            }) { _ in
                homeNavVC.didMove(toParent: self)
            }
        }
    }

    
    
    //MARK: - Slide & Scale Effect
//    func goToHome() {
//        UIView.animate(withDuration: 0.5, animations: {
//            self.splashViewController?.view.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height) // Move Up
//            self.splashViewController?.view.alpha = 0
//        }) { _ in
//            self.splashViewController?.willMove(toParent: nil)
//            self.splashViewController?.view.removeFromSuperview()
//            self.splashViewController?.removeFromParent()
//
//            let homeNavVC = StoryBoard.Main.instance.instantiateViewController(withIdentifier: "HomeNavVC") as! UINavigationController
//            self.addChild(homeNavVC)
//            self.view.addSubview(homeNavVC.view)
//
//            homeNavVC.view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2) // Start Bigger
//            homeNavVC.view.alpha = 0
//
//            UIView.animate(withDuration: 0.5, animations: {
//                homeNavVC.view.transform = .identity
//                homeNavVC.view.alpha = 1
//            }) { _ in
//                homeNavVC.didMove(toParent: self)
//            }
//        }
//    }



}

