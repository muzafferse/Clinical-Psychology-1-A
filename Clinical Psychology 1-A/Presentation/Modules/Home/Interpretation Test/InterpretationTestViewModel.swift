//
//  InterpretationTestViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 15.05.2024.
//

import SwiftUI

class InterpretationTestViewModel: ObservableObject {
    @Published var trainingWelcomeMessage = AppStrings.interpretationTestTrainingWelcomeMessage
    @Published var trainingWelcomeButtonText = AppStrings.interpretationTestTrainingWelcomeButtonText
    
    @Published var trainingDescriptionMessage = AppStrings.interpretationTestTrainingDescription
    @Published var trainingDescriptionButtonText = AppStrings.interpretationTestTrainingButtonText
}
