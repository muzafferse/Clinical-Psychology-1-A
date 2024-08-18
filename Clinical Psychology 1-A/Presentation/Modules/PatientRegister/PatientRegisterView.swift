//
//  PatientRegisterView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 3.06.2024.
//

import SwiftUI

struct PatientRegisterView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject var viewModel = PatientRegisterViewModel()
    
    @Environment(\.dismiss) var dismiss
    
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
                            PasswordInputFieldView(title: viewModel.patientPassword,
                                                   text: $viewModel.password,
                                                   textFieldStyle: $viewModel.passwordTextFieldStyle,
                                                   toggleAction: {
                                viewModel.passwordTextFieldStyle.isHidden.toggle()
                            })
                            
                            // Re-Password Textfield
                            PasswordInputFieldView(title: viewModel.patientRepassword,
                                                   text: $viewModel.repassword,
                                                   textFieldStyle: $viewModel.repasswordTextFieldStyle,
                                                   toggleAction: {
                                viewModel.repasswordTextFieldStyle.isHidden.toggle()
                            })
                        }
                        
                        // Register Button
                        Button(action: {
                            if !viewModel.isPasswordLengthEnough() {
                                viewModel.alertMessage = viewModel.passwordLengthWarning
                                viewModel.showAlert = true
                            } else if !viewModel.isPasswordsMatch() {
                                viewModel.alertMessage = viewModel.passwordMatchWarning
                                viewModel.showAlert = true
                            } else {
                                authManager.register(withEmail: viewModel.nickName,
                                                     password: viewModel.password) { success, errorMessage in
                                    if success {
                                        dismiss()
                                    } else {
                                        viewModel.alertMessage = errorMessage ?? "Unknown error"
                                        viewModel.showAlert = true
                                    }
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
        PatientRegisterView()
    }
}
