//
//  Haptics.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import UIKit

// Generate Haptics
func generateHaptics() {
    let impactMed = UIImpactFeedbackGenerator(style: .rigid)
    impactMed.impactOccurred()
}
