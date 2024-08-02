//
//  PatientRegisterViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 3.06.2024.
//

import Firebase
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
    
    let passwordWarning = "Lütfen girdiğiniz şifrelerin aynı olduğundan emin olun."
    let popupTitle = "Hata"
    let popupButtonText = "Tamam"
    
    var registerButtonStyle: CustomButtonStyle {
        return isRegisterButtonActive() ? PrimaryActiveButtonStyle() : PrimaryInactiveButtonStyle()
    }
    
    func isRegisterButtonActive() -> Bool {
        return (!nickName.isEmpty && !password.isEmpty && !repassword.isEmpty)
    }
    
    func isPasswordsMatch() -> Bool {
        return password == repassword
    }
    
    func registerUser(completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: nickName + "@gmail.com",
                               password: password) { authResult, error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
                completion(false)
            } else if let authResult = authResult {
                print("User created successfully")
                self.saveUserDetails(uid: authResult.user.uid,
                                     completion: completion)
            }
        }
    }
    
    private func saveUserDetails(uid: String, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        db.collection("users").document(uid).setData([
            "nickName": self.nickName,
        ]) { error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
                completion(false)
            } else {
                print("User details saved successfully")
                completion(true)
            }
        }
    }
}
