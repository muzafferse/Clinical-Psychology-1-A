//
//  Clinical_Psychology_1_AApp.swift
//  Clinical Psychology 1
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

@main
struct Clinical_Psychology_1_App: App {
    @UIApplicationDelegateAdaptor(AppCoordinator.self) var appCoordinator
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(appState)
        }
    }
}
