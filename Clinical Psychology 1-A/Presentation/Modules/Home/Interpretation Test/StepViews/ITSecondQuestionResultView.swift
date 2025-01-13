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
                .robotoRegularFont(size: 16)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                viewModel.nextStep()
            }
        }
    }
}

#Preview {
    ZStack {
        Color(.colorBackground)
            .ignoresSafeArea()
        ITSecondQuestionResultView(viewModel: InterpretationTestViewModel())
    }
}
