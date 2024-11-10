//
//  SettingsTabRootView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 28.04.2024.
//

import SwiftUI

//MARK: - Settings View
// The main view for displaying the Settings dashboard
struct SettingsTabRootView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject var viewModel: SettingsTabRootViewModel
    
    var body: some View {
        ZStack {
            Color(.colorBackground)
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 3) {
                    HStack {
                        Button(action: {
                            self.appState.settingsNavigation.append(SettingsNavDestination.contributors)
                        }) {
                            Text(AppStrings.contributorsButtonText)
                                .robotoMediumFont(size: 20)
                                .foregroundStyle(.colorWhite)
                            
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
                .padding(.top, 24)
                .padding(.horizontal, 24)
                
                Spacer()
            }
            .padding(.vertical, 12)
        }
        .navigationTitle(AppStrings.settingsTitle)
        .navigationBarTitleTextColor(.colorWhite)
    }
}

#Preview {
    SettingsTabRootView(viewModel: SettingsTabRootViewModel())
}
