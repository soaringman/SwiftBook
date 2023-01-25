//
//  AppDelegate.swift
//  BasicsOfSurvival.git
//
//  Created by Sergei Vikhliaev on 20.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        AppCoordinator(window: window).start()

        return true
    }
}
