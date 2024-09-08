//
//  AuthManager.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 18.08.2024.
//

import Firebase
import FirebaseAuth

@MainActor
class AuthManager: ObservableObject {
    @Published var user: User?
    @Published var authState = AuthState.signedIn
    
    private var authStateHandle: AuthStateDidChangeListenerHandle!
    
    init() {
        self.user = Auth.auth().currentUser
        self.authState = self.user != nil ? .signedIn : .signedOut
        self.configureAuthStateChanges()
    }
    
    func configureAuthStateChanges() {
        authStateHandle = Auth.auth().addStateDidChangeListener { auth, user in
            print("Auth changed: \(user != nil)")
            self.updateState(user: user)
        }
    }
    
    func removeAuthStateListener() {
        Auth.auth().removeStateDidChangeListener(authStateHandle)
    }
    
    func updateState(user: User?) {
        self.user = user
        let isAuthenticatedUser = user != nil
        
        if isAuthenticatedUser {
            self.authState = .signedIn
        } else {
            self.authState = .signedOut
        }
    }
    
    func signOut() async throws {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
            }
            catch let error as NSError {
                print("FirebaseAuthError: failed to sign out from Firebase, \(error)")
                throw error
            }
        }
    }
    
    func signIn(withEmail email: String, password: String, completion: @escaping (Bool, AuthError?) -> Void) {
        Auth.auth().signIn(withEmail: email + "@gmail.com",
                           password: password) { authResult, error in
            if let error = error as NSError? {
                let authError = AuthError(error: error)
                completion(false, authError)
            } else {
                self.updateState(user: authResult?.user)
                completion(true, nil)
            }
        }
    }
    
    func register(withEmail email: String, password: String, completion: @escaping (Bool, AuthError?) -> Void) {
        Auth.auth().createUser(withEmail: email + "@gmail.com",
                               password: password) { authResult, error in
            if let error = error as NSError? {
                let authError = AuthError(error: error)
                completion(false, authError)
            } else if let authResult = authResult {
                self.saveUserDetails(uid: authResult.user.uid) { success, errorMessage in
                    completion(success, errorMessage)
                }
            }
        }
    }
    
    private func saveUserDetails(uid: String, completion: @escaping (Bool, AuthError?) -> Void) {
        let db = Firestore.firestore()
        db.collection("users").document(uid).setData([
            "nickName": self.user?.email ?? ""
        ]) { error in
            if let error = error as NSError? {
                let authError = AuthError(error: error)
                completion(false, authError)
            } else {
                print("User details saved successfully")
                completion(true, nil)
            }
        }
    }
}
