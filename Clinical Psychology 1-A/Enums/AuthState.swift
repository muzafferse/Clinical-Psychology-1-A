//
//  AuthState.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.08.2024.
//

import Foundation

enum AuthState {
    case signedIn // Authenticated in Firebase using email.
    case signedOut // Not authenticated in Firebase.
}
