//
//  PatientRegisterView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 3.06.2024.
//

import SwiftUI

struct PatientRegisterView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel = PatientRegisterViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.colorBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        VStack(spacing: 16) {
                            
                            Spacer()
                            
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
                            if viewModel.isPasswordsMatch() {
                                viewModel.registerUser { success in
                                    if success {
                                        dismiss()
                                    }
                                }
                            } else {
                                viewModel.alertMessage = viewModel.passwordWarning
                                viewModel.showAlert = true
                            }
                        },
                               label: {
                            Text(viewModel.registerButtonText)
                        })
                        .buttonStyle(.customButton(.constant(viewModel.registerButtonStyle)))
                        .disabled(!viewModel.isRegisterButtonActive())
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                }
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
