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
                            Text(viewModel.contributorsButtonText)
                                .font(.custom(.roboto, style: .regular, size: 18))
                                .foregroundStyle(.colorWhite)
                            
                            Spacer()
                            
                            viewModel.chevronRight
                                .foregroundStyle(.colorWhite)
                        }
                    }
                    .padding(.horizontal, 24)
                    
                    Divider()
                        .padding(.horizontal, 24)
                        .foregroundStyle(.colorInactive)
                }
                
                Button(action: {
                    appState.isUserLoggedIn = false
                    appState.selectedTab = .home
                }) {
                    Text(viewModel.logoutButtonText)
                }
                .buttonStyle(.customButton(.constant(PrimaryActiveButtonStyle())))
                .padding(.top, 48)
                .padding(.horizontal, 24)
                
                Spacer()
            }
            .padding(.vertical, 12)
        }
        .navigationTitle(viewModel.title)
        .navigationBarTitleTextColor(.colorWhite)
    }
}

#Preview {
    SettingsTabRootView(viewModel: SettingsTabRootViewModel())
}
