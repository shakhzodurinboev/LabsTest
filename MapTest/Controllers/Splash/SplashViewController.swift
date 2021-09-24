//
//  SplashViewController.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import UIKit

class SplashViewController: UIViewController, ViewSpecificController {
    
    // MARK: - RootView
    typealias RootView = SplashRootView
    
    override func loadView() {
        super.loadView()
        self.view = SplashRootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.start()
    }
    
    func start() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            guard let window = UIApplication.shared.keyWindow else { return }
            let controller = LocationViewController()
            let navigation = DefaultNavigationController(rootViewController: controller)
            window.rootViewController = navigation
            let options: UIView.AnimationOptions = .transitionCrossDissolve
            let duration: TimeInterval = 0.3
            UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
                                { completed in
                                    // maybe do something on completion here
                                })
        }
    }
    
}
