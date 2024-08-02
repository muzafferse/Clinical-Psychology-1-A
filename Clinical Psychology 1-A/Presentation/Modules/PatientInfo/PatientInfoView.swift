//
//  PatientInfoView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct PatientInfoView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel = PatientInfoViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.colorBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    VStack(spacing: 16) {
                        
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
                        viewModel.loginUser { success, uid in
                            if success, let uid = uid {
                                appState.isUserLoggedIn = true
                                appState.selectedTab = .home
                                appState.fetchUserName(uid: uid)
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
                .padding(.top, 16)
                .navigationTitle(viewModel.appName)
                .navigationBarTitleTextColor(.colorWhite)
                .navigationBarTitleDisplayMode(.large)
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(viewModel.popupTitle),
                      message: Text(viewModel.alertMessage),
                      dismissButton: .default(Text(viewModel.popupButtonText)))
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
