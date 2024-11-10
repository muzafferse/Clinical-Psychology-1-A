//
//  InterpretationTestTrainingDescriptionView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 22.09.2024.
//

import SwiftUI

struct InterpretationTestTrainingDescriptionView: View {
    let viewModel: InterpretationTestViewModel
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.interpretationTestTrainingDescription)
                .robotoRegularFont(size: 16)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
            
            Spacer()
            
            Button(action: onNext) {
                Text(AppStrings.interpretationTestTrainingButtonText)
            }
            .primaryActiveButtonStyle()
            .padding(.bottom, 36)
        }
    }
}

#Preview {
    ZStack {
        Color(.colorBackground)
            .ignoresSafeArea()
        InterpretationTestTrainingDescriptionView(viewModel: InterpretationTestViewModel(),
                                                  onNext: {})
    }
}
