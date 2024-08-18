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
    
    ///Manage navigation Flow of app screens
    @Published var homeNavigation: NavigationPath = NavigationPath()
    @Published var settingsNavigation: NavigationPath = NavigationPath()
}
