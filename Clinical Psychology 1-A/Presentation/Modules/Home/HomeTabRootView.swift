//
//  HomeTabRootView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

//MARK: - Home View
// The main view for displaying the Home dashboard
struct HomeTabRootView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel: HomeTabRootViewModel
    
    var body: some View {
        ZStack {
            Color(.colorBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Merhaba, \(appState.nickName)")
                    .font(.custom(.roboto, style: .medium, size: 20))
                    .foregroundStyle(.colorWhite)
                
                Text(viewModel.warningMessage)
                    .font(.custom(.roboto, style: .regular, size: 16))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.colorWhite)
                    .padding(.top, 48)
                
                Spacer()
                
                Button {
                    self.appState.homeNavigation.append(HomeNavDestination.cautionTest)
                } label: {
                    Text(viewModel.generalTestButton)
                }
                .buttonStyle(.customButton(.constant(PrimaryActiveButtonStyle())))
                .padding(.bottom, 12)

                /*
                // Dikkat Yanlılığı Değişimleme
                Button(action: {
                    self.appState.homeNavigation.append(HomeNavDestination.cautionTest)
                },
                       label: {
                    Text(viewModel.cautionTestName)
                })
                .buttonStyle(.customButton(.constant(viewModel.cautionTestStyle)))
                
                // Yorumlama Yanlılığı Değişimleme
                Button(action: {
                    self.appState.homeNavigation.append(HomeNavDestination.interpretationTest)
                },
                       label: {
                    Text(viewModel.interpretationTestName)
                })
                .buttonStyle(.customButton(.constant(viewModel.interpretationTestStyle)))
                */
            }
            .padding(.all, 24)
        }
        .navigationTitle(viewModel.title)
        .navigationBarTitleTextColor(.colorWhite)
    }
}

#Preview {
    HomeTabRootView(viewModel: HomeTabRootViewModel())
}
