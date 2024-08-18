//
//  Clinical_Psychology_1_AApp.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

@main
struct Clinical_Psychology_1_AApp: App {
    @UIApplicationDelegateAdaptor(AppCoordinator.self) var appCoordinator
    @StateObject private var appState = AppState()
    @StateObject private var authManager = AuthManager()
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(appState)
                .environmentObject(authManager)
        }
    }
}
