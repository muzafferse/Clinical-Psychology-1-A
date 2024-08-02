//
//  PatientInfoViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import Firebase
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
    
    let popupTitle = "Hata!"
    let popupButtonText = "Tamam"
    
    var loginButtonStyle: CustomButtonStyle {
        return isLoginButtonActive() ? PrimaryActiveButtonStyle() : PrimaryInactiveButtonStyle()
    }
    
    func isLoginButtonActive() -> Bool {
        return (!nickName.isEmpty && !password.isEmpty)
    }
    
    func loginUser(completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().signIn(withEmail: nickName + "@gmail.com",
                           password: password) { authResult, error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
                completion(false, nil)
            } else if let authResult = authResult {
                completion(true, authResult.user.uid)
            }
        }
    }
}
