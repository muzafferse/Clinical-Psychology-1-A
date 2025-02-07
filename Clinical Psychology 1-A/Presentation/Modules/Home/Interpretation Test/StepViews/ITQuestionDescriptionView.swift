//
//  ITQuestionDescriptionView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 10.11.2024.
//

import SwiftUI

struct ITQuestionDescriptionView: View {
    let viewModel: InterpretationTestViewModel
    @State private var isGestureEnabled: Bool = false
    
    var body: some View {
        VStack(spacing: 32) {
            if let currentQuestion = viewModel.getCurrentQuestion() {
                Text(currentQuestion.questionDescription)
                    .regularTextStyle(size: 16)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .onTapGesture {
            if isGestureEnabled {
                viewModel.nextStep()
            }
        }
        .onAppear {
            //TODO: Should be 10. Changed for test.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isGestureEnabled = true
            }
        }
    }
}

#Preview {
    ITQuestionDescriptionView(viewModel: InterpretationTestViewModel())
}
