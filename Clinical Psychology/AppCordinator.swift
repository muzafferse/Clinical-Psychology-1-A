//
//  AppCordinator.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import UIKit

class AppCoordinator: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Handle app Did Finish Launching With Options
        FirebaseGateway.configure()
#if CLINIC1A
        print("CLINIC1A")
#elseif CLINIC1B
        print("CLINIC1B")
#else
        print("OTHERS")
#endif
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Handle app entering background
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Handle app entering foreground
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Handle app termination
    }
}
