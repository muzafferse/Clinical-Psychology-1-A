//
//  SettingsTabRootView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 28.04.2024.
//

import SwiftUI

//MARK: - SettingsView
// The main view for displaying the Settings dashboard
struct SettingsTabRootView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject var viewModel: SettingsTabRootViewModel
    
    var body: some View {
        VStack {
            //TODO: Future Work - Contributors
            /*
            VStack(spacing: 3) {
                HStack {
                    Button(action: {
                        self.appState.settingsNavigation.append(SettingsNavDestination.contributors)
                    }) {
                        Text(AppStrings.contributorsButtonText)
                            .mediumTextStyle(size: 20)
                        
                        Spacer()
                        
                        Image.chevronRight
                            .foregroundStyle(.colorWhite)
                    }
                }
                
                Divider()
                    .frame(height: 1)
                    .background(.colorInactive)
            }
            .padding(.horizontal, 24)
             */
            
            Button(action: {
                Task {
                    do {
                        try await authManager.signOut()
                        authManager.authState = .signedOut
                        appState.selectedTab = .home
                    } catch {
                        print("Error signing out: \(error)")
                    }
                }
            }) {
                Text(AppStrings.logoutButtonText)
            }
            .primaryActiveButtonStyle()
            //TODO: Future Work - Contributors 24,24
            .padding(.top, 0)
            .padding(.horizontal, 48)
            
            Spacer()
        }
        .padding(.vertical, 12)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .navigationTitle(AppStrings.settingsTitle)
        .navigationBarTitleTextColor(.colorWhite)
    }
}

#Preview {
    SettingsTabRootView(viewModel: SettingsTabRootViewModel())
}
