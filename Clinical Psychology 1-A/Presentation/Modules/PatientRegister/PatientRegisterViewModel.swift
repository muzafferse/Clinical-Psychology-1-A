//
//  PatientRegisterViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 3.06.2024.
//

import Foundation
import SwiftUI

class PatientRegisterViewModel: ObservableObject {
    @Published var nickName: String = ""
    @Published var password: String = ""
    @Published var passwordTextFieldStyle: CustomTextFieldStyle = PasswordTextFieldStyle()
    @Published var repassword: String = ""
    @Published var repasswordTextFieldStyle: CustomTextFieldStyle = PasswordTextFieldStyle()
    
    @Published var appName = AppStrings.appName
    @Published var patientNickName = AppStrings.nickName
    @Published var patientPassword = AppStrings.password
    @Published var patientRepassword = AppStrings.repeatPassword
    @Published var registerButtonText = AppStrings.registerButtonText
    
    @Published var chevronLeft = Image(systemName: "chevron.left")
    @Published var backButtonTitle = AppStrings.registerBackButtonText
    
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    let passwordMatchWarning = AppStrings.registerPasswordMatchWarning
    let popupTitle = AppStrings.registerPopupTitle
    let popupButtonText = AppStrings.registerPopupButtonText
    
    var registerButtonStyle: CustomButtonStyle {
        return isRegisterButtonActive() ? PrimaryActiveButtonStyle() : PrimaryInactiveButtonStyle()
    }
    
    func isRegisterButtonActive() -> Bool {
        return (!nickName.isEmpty && !password.isEmpty && !repassword.isEmpty && isPasswordsMatch())
    }
    
    func isPasswordsMatch() -> Bool {
        return password == repassword
    }
}
