//
//  AppState.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import Firebase
import SwiftUI

@MainActor
final class AppState: ObservableObject {
    @Published var selectedTab: AppTab = .home
    
    @Published var isUserLoggedIn: Bool {
        didSet {
            UserDefaults.standard.set(isUserLoggedIn, forKey: "isUserLoggedIn")
        }
    }
    
    @Published var nickName: String = "" {
        didSet {
            UserDefaults.standard.set(nickName, forKey: "nickName")
        }
    }
    
    ///Manage navigation Flow of app screens
    @Published var homeNavigation: NavigationPath = NavigationPath()
    @Published var settingsNavigation: NavigationPath = NavigationPath()
    
    init() {
        self.isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        self.nickName = UserDefaults.standard.string(forKey: "nickName") ?? "Misafir Kullanıcı"
    }
    
    func fetchUserName(uid: String) {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let data = document.data(), let fetchedName = data["nickName"] as? String {
                    DispatchQueue.main.async {
                        self.nickName = fetchedName
                    }
                }
            } else {
                print("Document does not exist")
            }
        }
    }
}
