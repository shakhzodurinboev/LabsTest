//
//  AppDelegate.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import UIKit
import GoogleMaps
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey("AIzaSyDfyS6WHIGwttPgVpK-mD9ti07vyN23Ek4")
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = SplashViewController()
        self.window?.makeKeyAndVisible()

        return true
    }

}

