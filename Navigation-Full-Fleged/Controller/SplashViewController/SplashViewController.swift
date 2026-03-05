//
//  SplashViewController.swift
//  Navigation-Full-Fleged
//
//  Created by Vasu Chovatiya on 05/03/25.
//

import UIKit

class SplashViewController: UIViewController {
    // MARK: -  IBOutlet
    
    // MARK: -  Properties
    var loaderView: NVActivityIndicatorView?

    // MARK: -  LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadingAnimationView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        loaderView?.stopAnimating()
    }
    
    // MARK: -  Functions
    private func setupLoadingAnimationView() {
        loaderView = NVActivityIndicatorView(frame: .init(x: 0, y: 0, width: 100, height: 100), type: .circleStrokeSpin, color: .blue, padding: 0)
        loaderView!.center = view.center
        view.addSubview(loaderView!)
        loaderView!.startAnimating()
    }
    
   
    
    // MARK: -  Deinit
    deinit {
        print("SplashViewController deinit")
    }

}
