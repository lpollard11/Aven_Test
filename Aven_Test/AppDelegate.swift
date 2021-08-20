//
//  AppDelegate.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/18/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        // Have the ViewControllerFactory create and set the root controller of the app.
        window.rootViewController = ViewControllerFactory().organizationsViewController()
        window.makeKeyAndVisible()
        return true
    }


}

