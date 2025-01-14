//
//  ITFirstQuestionView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 11.11.2024.
//

import SwiftUI

struct ITFirstQuestionView: View {
    let viewModel: InterpretationTestViewModel
    @Binding var answer: String
    
    @State private var showCompletedSentence: Bool = false
    
    private var completedSentence: String {
        if let question = getCurrentQuestion()?.firstQuestion,
           let answer = getCurrentQuestion()?.firstQuestionAnswer {
            return question.replacingOccurrences(of: "_", with: answer)
        } else {
            return ""
        }
    }
    
    var body: some View {
        VStack(spacing: 32) {
            if showCompletedSentence {
                Text(completedSentence)
                    .robotoRegularFont(size: 16)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.colorWhite)
            } else {
                if let question = getCurrentQuestion()?.firstQuestion {
                    Text(question)
                        .robotoRegularFont(size: 16)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.colorWhite)
                }
                
                if let expectedAnswer = getCurrentQuestion()?.firstQuestionAnswer {
                    AnswerTextFieldView(text: $answer,
                                        expectedCharacter: expectedAnswer) {
                        handleCorrectAnswer()
                    }
                                        .frame(width: 200)
                }
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
    
    private func handleCorrectAnswer() {
        showCompletedSentence = true
        //TODO: Should be 5. Changed for test.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showCompletedSentence = false
            viewModel.nextStep()
        }
    }
}

#Preview {
    ITFirstQuestionView(viewModel: InterpretationTestViewModel(),
                        answer: .constant(""))
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(
        Color(.colorBackground)
            .ignoresSafeArea()
    )
}
