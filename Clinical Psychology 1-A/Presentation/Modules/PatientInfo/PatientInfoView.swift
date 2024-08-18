//
//  PatientInfoView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct PatientInfoView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject var viewModel = PatientInfoViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.colorBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 32) {
                        VStack(spacing: 24) {
                            
                            // Patient Nickname Textfield
                            InputFieldView(title: viewModel.patientNickName,
                                           text: $viewModel.nickName,
                                           textFieldStyle: UsernameTextFieldStyle())
                            
                            // Password Textfield
                            PasswordInputFieldView(title: viewModel.passwordInfo,
                                                   text: $viewModel.password,
                                                   textFieldStyle: $viewModel.passwordTextFieldStyle,
                                                   toggleAction: { viewModel.passwordTextFieldStyle.isHidden.toggle()
                            })
                        }
                        
                        // Login Button
                        Button(action: {
                            authManager.signIn(withEmail: viewModel.nickName,
                                               password: viewModel.password) { success, error in
                                if success {
                                    authManager.authState = .signedIn
                                    appState.selectedTab = .home
                                } else {
                                    viewModel.alertMessage = error ?? "Unknown Error"
                                    viewModel.showAlert = true
                                }
                            }
                        },
                               label: {
                            Text(viewModel.loginButtonText)
                        })
                        .buttonStyle(.customButton(.constant(viewModel.loginButtonStyle)))
                        .disabled(!viewModel.isLoginButtonActive())
                        
                        // Register Button
                        NavigationLink(destination: PatientRegisterView()) {
                            Text(viewModel.registerButtonText)
                        }
                        .buttonStyle(.customButton(.constant(TextButtonStyle())))
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 60)
                }
                .clipped()
                .scrollDisabled(true)
                .navigationTitle(viewModel.appName)
                .navigationBarTitleTextColor(.colorWhite)
                .navigationBarTitleDisplayMode(.large)
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(viewModel.popupTitle),
                      message: Text(viewModel.alertMessage),
                      dismissButton: .default(Text(viewModel.popupButtonText)))
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

#Preview {
    ZStack {
        Color(.colorBackground)
            .ignoresSafeArea()
        PatientInfoView()
    }
}
