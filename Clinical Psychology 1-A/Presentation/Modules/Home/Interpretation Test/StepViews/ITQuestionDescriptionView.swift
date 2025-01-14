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
            if let currentQuestion = getCurrentQuestion() {
                Text(currentQuestion.questionDescription)
                    .robotoRegularFont(size: 16)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.colorWhite)
            }
        }
        .onTapGesture {
            if isGestureEnabled {
                viewModel.nextStep()
            }
        }
        .onAppear {
            //TODO: Should be 10. Changed for test.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isGestureEnabled = true
            }
        }
    }
    
    //TODO: Should move on viewModel or sessionGenerator
    private func getCurrentQuestion() -> Question? {
        if viewModel.isFirstSession {
            guard let neutralSession = viewModel.neutralSession,
                  viewModel.currentQuestionIndex < neutralSession.count else {
                return nil
            }
            return neutralSession[viewModel.currentQuestionIndex]
        } else {
            guard viewModel.currentQuestionIndex < viewModel.currentSession.count else {
                return nil
            }
            return viewModel.currentSession[viewModel.currentQuestionIndex]
        }
    }
}

#Preview {
    ITQuestionDescriptionView(viewModel: InterpretationTestViewModel())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
}
