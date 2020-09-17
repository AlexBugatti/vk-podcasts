//
//  AppDelegate.swift
//  vk-podcast
//
//  Created by Александр on 16.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupNavBar()
        UIFont.familyNames.forEach({ familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(familyName, fontNames)
        })
        // Override point for customization after application launch.
        return true
    }
    
    func setupNavBar() {
        let attributes = [NSAttributedString.Key.font: UIFont.getTTCommonsFont(type: .demibold, size: 21)]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().tintColor = Pallete.main
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }


}

