//
//  AuthError.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 18.08.2024.
//

import Foundation
import FirebaseAuth

enum AuthError: Error, LocalizedError {
    case invalidCredential
    case emailAlreadyInUse
    case invalidEmail
    case weakPassword
    case wrongPassword
    case userNotFound
    case userDisabled
    case tooManyRequests
    case operationNotAllowed
    case networkError
    case unknownError
    
    init(error: NSError) {
        switch error.code {
        case AuthErrorCode.invalidCredential.rawValue:
            self = .invalidCredential
        case AuthErrorCode.emailAlreadyInUse.rawValue:
            self = .emailAlreadyInUse
        case AuthErrorCode.invalidEmail.rawValue:
            self = .invalidEmail
        case AuthErrorCode.weakPassword.rawValue:
            self = .weakPassword
        case AuthErrorCode.wrongPassword.rawValue:
            self = .wrongPassword
        case AuthErrorCode.userNotFound.rawValue:
            self = .userNotFound
        case AuthErrorCode.userDisabled.rawValue:
            self = .userDisabled
        case AuthErrorCode.tooManyRequests.rawValue:
            self = .tooManyRequests
        case AuthErrorCode.operationNotAllowed.rawValue:
            self = .operationNotAllowed
        case AuthErrorCode.networkError.rawValue:
            self = .networkError
        default:
            self = .unknownError
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .invalidCredential:
            return "Rumuz veya şifre yanlış. Lütfen şifrenizi ve rumuzunuzu doğru girdiğinizden emin olun."
        case .emailAlreadyInUse:
            return "Bu rumuz ile zaten bir kullanıcı kayıtlı."
        case .invalidEmail:
            return "Geçersiz bir rumuz girdiniz."
        case .weakPassword:
            return "Şifre 6 karakterden kısa. Lütfen daha uzun bir şifre seçin."
        case .wrongPassword:
            return "Şifre yanlış. Lütfen tekrar deneyin."
        case .userNotFound:
            return "Bu kullanıcı mevcut değil."
        case .userDisabled:
            return "Bu kullanıcı devre dışı bırakılmış."
        case .tooManyRequests:
            return "Çok fazla istek gönderildi. Lütfen daha sonra tekrar deneyin."
        case .operationNotAllowed:
            return "Bu işlem şu anda yapılamıyor."
        case .networkError:
            return "Ağ hatası. Lütfen daha sonra tekrar deneyin."
        case .unknownError:
            return "Bilinmeyen bir hata oluştu."
        }
    }
}
