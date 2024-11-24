//
//  InterpretationTestSecondQuestionResultView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 14.11.2024.
//

import SwiftUI

struct InterpretationTestSecondQuestionResultView: View {
    let isCorrect: Bool
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            Text(isCorrect ? AppStrings.interpretationTestCorrect : AppStrings.interpretationTestIncorrect)
                .robotoRegularFont(size: 16)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                onNext()
            }
        }
    }
}

#Preview {
    ZStack {
        Color(.colorBackground)
            .ignoresSafeArea()
        InterpretationTestSecondQuestionResultView(isCorrect: true, onNext: {})
    }
}
