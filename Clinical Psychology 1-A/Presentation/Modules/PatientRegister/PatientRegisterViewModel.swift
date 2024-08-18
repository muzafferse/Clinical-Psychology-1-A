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
    
    @Published var appName = "Klinik Psikoloji Grup 1-A"
    @Published var patientNickName = "Rumuz"
    @Published var patientPassword = "Şifre"
    @Published var patientRepassword = "Şifreyi Onayla"
    @Published var registerButtonText = "Kayıt Ol"
    
    @Published var chevronLeft = Image(systemName: "chevron.left")
    @Published var backButtonTitle = "Giriş Yap"
    
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    let passwordMatchWarning = "Lütfen girdiğiniz şifrelerin aynı olduğundan emin olun."
    let popupTitle = "Hata"
    let popupButtonText = "Tamam"
    
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
