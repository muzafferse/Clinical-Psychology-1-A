//
//  InterpretationTestFirstQuestionView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 11.11.2024.
//

import SwiftUI

struct InterpretationTestFirstQuestionView: View {
    let viewModel: InterpretationTestViewModel
    @Binding var answer: String
    let onCorrectAnswer: () -> Void
    
    @State private var showCompletedSentence: Bool = false
    
    private var completedSentence: String {
        let question = viewModel.interpretationQuestions[0].firstQuestion
        let answer = viewModel.interpretationQuestions[0].firstQuestionAnswer
        return question.replacingOccurrences(of: "_", with: answer)
    }
    
    var body: some View {
        VStack(spacing: 32) {
            if showCompletedSentence {
                Text(completedSentence)
                    .robotoRegularFont(size: 16)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.colorWhite)
            } else {
                Text(viewModel.interpretationQuestions[0].firstQuestion)
                    .robotoRegularFont(size: 16)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.colorWhite)
                
                AnswerTextFieldView(text: $answer,
                                    expectedCharacter: viewModel.interpretationQuestions[0].firstQuestionAnswer) {
                    handleCorrectAnswer()
                }
                                    .frame(width: 200)
            }
        }
    }
    
    private func handleCorrectAnswer() {
        showCompletedSentence = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            showCompletedSentence = false
            onCorrectAnswer()
        }
    }
}

#Preview {
    ZStack {
        Color(.colorBackground)
            .ignoresSafeArea()
        InterpretationTestFirstQuestionView(viewModel: InterpretationTestViewModel(),
                                            answer: .constant(""),
                                            onCorrectAnswer: {})
    }
}
