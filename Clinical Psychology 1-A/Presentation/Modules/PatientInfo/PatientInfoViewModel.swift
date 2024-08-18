//
//  PatientInfoViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import Foundation

class PatientInfoViewModel: ObservableObject {
    @Published var nickName = ""
    @Published var password = ""
    @Published var passwordTextFieldStyle: CustomTextFieldStyle = PasswordTextFieldStyle()
    
    @Published var appName = "Klinik Psikoloji Grup 1-A"
    @Published var patientNickName = "Rumuz"
    @Published var passwordInfo = "Şifre"
    @Published var loginButtonText = "Giriş Yap"
    @Published var registerButtonText = "Kayıt Ol"
    
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    let passwordLengthWarning = "Şifreniz 6 karakterden uzun olmalıdır."
    let popupTitle = "Hata!"
    let popupButtonText = "Tamam"
    
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
