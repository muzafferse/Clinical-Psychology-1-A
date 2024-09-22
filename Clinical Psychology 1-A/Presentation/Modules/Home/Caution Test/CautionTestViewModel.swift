//
//  CautionTestViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 28.04.2024.
//

import SwiftUI

class CautionTestViewModel: ObservableObject {
    
    @Published var startDescription: String = AppStrings.cautionTestStartDescription
    @Published var startButtonText: String = AppStrings.cautionTestStartButtonText
    
    @Published var finishDescription = AppStrings.cautionTestFinishDescription
    @Published var finishButtonText = AppStrings.cautionTestFinishButtonText
    
    @Published var plusIcon = Image(systemName: "plus")
    @Published var leftArrowIcon = Image(systemName: "arrow.left")
    @Published var rightArrowIcon = Image(systemName: "arrow.right")
    
    @Published var currentTrialIndex = 0
    @Published var totalTrials: [(Image, Image, ArrowDirection, Position)] = []
    
    init() {
        for _ in 0..<6 {
            let shuffledTrials = createTrials().shuffled()
            totalTrials.append(contentsOf: shuffledTrials)
        }
    }
    
    func createTrials() -> [(Image, Image, ArrowDirection, Position)] {
        let ocdPhotos = (1...12).map { Image("OCB-\($0)") }
        let neutralPhotos = (1...12).map { Image("Neutral-\($0)") }
        var trialPairs: [(Image, Image, ArrowDirection, Position)] = []
        
        for i in 0..<12 {
            for position in Position.allCases {
                for direction in ArrowDirection.allCases {
                    trialPairs.append((ocdPhotos[i], neutralPhotos[i], direction, position))
                }
            }
        }
        return trialPairs
    }
    
    var currentTrial: (Image, Image, ArrowDirection, Position) {
        return totalTrials[currentTrialIndex]
    }
}
