//
//  LoginView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    VStack(spacing: 24) {
                        
                        // User Nickname Textfield
                        InputFieldView(title: AppStrings.nickName,
                                       text: $viewModel.nickName,
                                       textFieldStyle: UsernameTextFieldStyle())
                        
                        // Password Textfield
                        PasswordInputFieldView(title: AppStrings.password,
                                               text: $viewModel.password,
                                               textFieldStyle: $viewModel.passwordTextFieldStyle,
                                               toggleAction: { viewModel.passwordTextFieldStyle.isHidden.toggle()
                        },
                                               warningMessage: viewModel.isPasswordEnough() ? nil : AppStrings.loginPasswordLengthWarning)
                    }
                    
                    // Login Button
                    Button(action: {
                        authManager.signIn(withEmail: viewModel.nickName,
                                           password: viewModel.password) { success, error in
                            if success {
                                authManager.authState = .signedIn
                                appState.selectedTab = .home
                            } else if let error = error {
                                viewModel.alertMessage = error.localizedDescription
                                viewModel.showAlert = true
                            }
                        }
                    },
                           label: {
                        Text(AppStrings.loginButtonText)
                    })
                    .buttonStyle(.customButton(.constant(viewModel.loginButtonStyle)))
                    .disabled(!viewModel.isLoginButtonActive())
                    
                    // Register Button
                    NavigationLink(destination: RegisterView()
                        .environmentObject(authManager)
                        .environmentObject(appState)
                    ) {
                        Text(AppStrings.registerButtonText)
                    }
                    .textButtonStyle()
                    
                }
                .padding(.horizontal, 24)
                .padding(.top, 60)
            }
            .clipped()
            .scrollDisabled(true)
            .background(
                Color(.colorBackground)
                    .ignoresSafeArea()
            )
            .navigationTitle(AppStrings.appName)
            .navigationBarTitleTextColor(.colorWhite)
            .navigationBarTitleDisplayMode(.large)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text(AppStrings.loginPopupTitle),
                  message: Text(viewModel.alertMessage),
                  dismissButton: .default(Text(AppStrings.loginPopupButtonText)))
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    LoginView()
}
