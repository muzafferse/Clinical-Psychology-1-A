//
//  CautionTestViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 28.04.2024.
//

import SwiftUI

class CautionTestViewModel: ObservableObject {
    @Published var currentTrialIndex = 0
    @Published var totalTrials: [TrialItem] = []
    
    var currentTrial: TrialItem {
        return totalTrials[currentTrialIndex]
    }
    
    init() {
        for _ in 0..<3 {
            let shuffledTrials = createTrials().shuffled()
            totalTrials.append(contentsOf: shuffledTrials)
        }
    }
    
    private func createTrials() -> [TrialItem] {
        let ocdPhotos = (1...12).map { CTImage(name: "OCB-\($0)") }
        let neutralPhotos = (1...12).map { CTImage(name: "Neutral-\($0)") }
        var trialPairs: [TrialItem] = []
        
        for i in 0..<12 {
            for position in Position.allCases {
                for direction in ArrowDirection.allCases {
                    let trialItem = TrialItem(ocdImage: ocdPhotos[i],
                                              neutralImage: neutralPhotos[i],
                                              direction: direction,
                                              position: position)
                    trialPairs.append(trialItem)
                }
            }
        }
        return trialPairs
    }
    
    }
}
