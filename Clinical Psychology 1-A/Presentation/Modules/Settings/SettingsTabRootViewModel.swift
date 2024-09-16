//
//  SettingsTabRootViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 28.04.2024.
//

import Foundation
import SwiftUI

//MARK: - View Model
// ViewModel responsible for managing data related to the Settings dashboard
class SettingsTabRootViewModel: ObservableObject, Identifiable {
    @Published var contributorsButtonText: String = AppStrings.contributorsButtonText
    @Published var chevronRight = Image(systemName: "chevron.right")
    
    @Published var logoutButtonText: String = AppStrings.logoutButtonText
    @Published var title: String = AppStrings.settingsTitle
}
