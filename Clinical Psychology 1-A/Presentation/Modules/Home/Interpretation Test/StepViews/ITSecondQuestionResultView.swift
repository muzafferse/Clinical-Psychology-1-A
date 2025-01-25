//
//  ITSecondQuestionResultView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 14.11.2024.
//

import SwiftUI

struct ITSecondQuestionResultView: View {
    @ObservedObject var viewModel: InterpretationTestViewModel
    
    var body: some View {
        VStack(spacing: 32) {
            Text(viewModel.isCorrectAnswer ? AppStrings.itCorrect : AppStrings.itIncorrect)
                .regularTextStyle(size: 16)
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .onAppear {
            //TODO: Should be 2.5. Changed for test.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                viewModel.nextStep()
            }
        }
    }
}

#Preview {
    ITSecondQuestionResultView(viewModel: InterpretationTestViewModel())
}
