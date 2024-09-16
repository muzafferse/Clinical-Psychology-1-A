//
//  LoginViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var nickName = ""
    @Published var password = ""
    @Published var passwordTextFieldStyle: CustomTextFieldStyle = PasswordTextFieldStyle()
    
    @Published var appName = AppStrings.appName
    @Published var patientNickName = AppStrings.nickName
    @Published var passwordInfo = AppStrings.password
    @Published var loginButtonText = AppStrings.loginButtonText
    @Published var registerButtonText = AppStrings.registerButtonText
    
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    let passwordLengthWarning = AppStrings.loginPasswordLengthWarning
    let popupTitle = AppStrings.loginPopupTitle
    let popupButtonText = AppStrings.loginPopupButtonText
    
    var loginButtonStyle: CustomButtonStyle {
        return isLoginButtonActive() ? PrimaryActiveButtonStyle() : PrimaryInactiveButtonStyle()
    }
    
    func isLoginButtonActive() -> Bool {
        return !nickName.isEmpty && isPasswordEnough()
    }
    
    func isPasswordEnough() -> Bool {
        return password.count >= 6
    }
}
