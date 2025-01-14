//
//  ITSecondQuestionView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 11.11.2024.
//

import SwiftUI

struct ITSecondQuestionView: View {
    let viewModel: InterpretationTestViewModel
    @State private var isButtonDisabled = false
    @State private var timer: Timer? = nil
    var onCompletion: ((Bool) -> Void)
    
    var body: some View {
        VStack(spacing: 96) {
            if let currentQuestion = getCurrentQuestion() {
                Text(currentQuestion.secondQuestion)
                    .robotoRegularFont(size: 16)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.colorWhite)
                
                
                HStack(spacing: 96) {
                    Button(action: {
                        handleSelection(isCorrect: currentQuestion.secondQuestionAnswer == .yes)
                    }, label: {
                        Text(AppStrings.itYes)
                    })
                    .frame(width: 96, height: 48)
                    .primaryActiveButtonStyle()
                    .disabled(isButtonDisabled)
                    
                    Button(action: {
                        handleSelection(isCorrect: currentQuestion.secondQuestionAnswer == .no)
                    }, label: {
                        Text(AppStrings.itNo)
                    })
                    .frame(width: 96, height: 48)
                    .primaryActiveButtonStyle()
                    .disabled(isButtonDisabled)
                }
                .foregroundStyle(.colorWhite)
            }
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    private func handleSelection(isCorrect: Bool) {
        isButtonDisabled = true
        stopTimer()
        onCompletion(isCorrect)
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
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 20, repeats: false) { _ in
            handleSelection(isCorrect: false)
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    ITSecondQuestionView(viewModel: InterpretationTestViewModel(), onCompletion: {_ in })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
}
