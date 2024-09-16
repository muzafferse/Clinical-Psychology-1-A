//
//  RegisterView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 3.06.2024.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject var viewModel = RegisterViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.colorBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 32) {
                        VStack(spacing: 24) {
                            
                            // User Nickname Textfield
                            InputFieldView(title: viewModel.userNickName,
                                           text: $viewModel.nickName,
                                           textFieldStyle: UsernameTextFieldStyle())
                            
                            // Password Textfield
                            PasswordInputFieldView(title: viewModel.userPassword,
                                                   text: $viewModel.password,
                                                   textFieldStyle: $viewModel.passwordTextFieldStyle,
                                                   toggleAction: {
                                viewModel.passwordTextFieldStyle.isHidden.toggle()
                            })
                            
                            // Re-Password Textfield
                            PasswordInputFieldView(title: viewModel.userRepassword,
                                                   text: $viewModel.repassword,
                                                   textFieldStyle: $viewModel.repasswordTextFieldStyle,
                                                   toggleAction: {
                                viewModel.repasswordTextFieldStyle.isHidden.toggle()
                            }, 
                                                   warningMessage: viewModel.isPasswordsMatch() ? nil : viewModel.passwordMatchWarning)
                        }
                        
                        // Register Button
                        Button(action: {
                            authManager.register(withEmail: viewModel.nickName,
                                                 password: viewModel.password) { success, error in
                                if success {
                                    dismiss()
                                } else if let error = error {
                                    viewModel.alertMessage = error.localizedDescription
                                    viewModel.showAlert = true
                                }
                            }
                        },
                               label: {
                            Text(viewModel.registerButtonText)
                        })
                        .buttonStyle(.customButton(.constant(viewModel.registerButtonStyle)))
                        .disabled(!viewModel.isRegisterButtonActive())
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 60)
                }
                .clipped()
                .scrollDisabled(true)
            }
            .navigationBarBackButtonHidden()
            .navigationTitle(viewModel.appName)
            .navigationBarTitleTextColor(.colorWhite)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            viewModel.chevronLeft
                            Text(viewModel.backButtonTitle)
                        }
                    }
                    .foregroundStyle(.colorWhite)
                }
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
        RegisterView()
    }
}
