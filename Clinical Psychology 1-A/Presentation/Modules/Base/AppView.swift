//
//  AppView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authManager: AuthManager
    
    // Use @StateObject to retain ViewModels.
    @StateObject private var homeTabViewModel = HomeTabRootViewModel()
    @StateObject private var settingsTabViewModel = SettingsTabRootViewModel()
    
    var body: some View {
        if authManager.authState == .loading {
            ProgressView("Loading...")
        } else if authManager.authState == .signedIn {
            VStack {
                switch self.appState.selectedTab {
                case .home:
                    HomeTabView(parentViewModel: homeTabViewModel)
                        .navigationBarTitleDisplayMode(.large)
                case .settings:
                    SettingsTabView(parentViewModel: settingsTabViewModel)
                        .navigationBarTitleDisplayMode(.large)
                }
                Spacer()
                TabBarView(selectedTab: $appState.selectedTab) // Display the tab bar
            }
            .ignoresSafeArea()
        } else {
            LoginView()
        }
    }
}

#Preview {
    AppView()
        .environmentObject(AppState())
        .environmentObject(AuthManager())
}
