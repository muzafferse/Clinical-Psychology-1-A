//
//  HomeTabRootView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

//MARK: - HomeView
// The main view for displaying the Home dashboard
struct HomeTabRootView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject var viewModel: HomeTabRootViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 32) {
                let username = authManager.user?.email?.components(separatedBy: "@").first ?? AppStrings.guestUser
                Text("Merhaba, \(username)")
                    .mediumTextStyle(size: 20)
                
                Text(AppStrings.welcomeDescription)
                //TODO: Check for standartization.
                    .regularTextStyle(size: 14)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer(minLength: 0)
            
            Button {
                //TODO: self.appState.homeNavigation.append(HomeNavDestination.cautionTest)
                self.appState.homeNavigation.append(HomeNavDestination.interpretationTest)
            } label: {
                Text(AppStrings.startTestButtonText)
            }
            .primaryActiveButtonStyle()
            .padding(.bottom, 12)
        }
        .padding(.all, 24)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .navigationTitle(AppStrings.homeTitle)
        .navigationBarTitleTextColor(.colorWhite)
    }
}

#Preview {
    HomeTabRootView(viewModel: HomeTabRootViewModel())
        .environmentObject(AppState())
        .environmentObject(AuthManager())
}
