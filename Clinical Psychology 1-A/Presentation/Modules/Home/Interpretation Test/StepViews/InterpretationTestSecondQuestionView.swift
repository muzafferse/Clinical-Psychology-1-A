//
//  InterpretationTestSecondQuestionView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 11.11.2024.
//

import SwiftUI

struct InterpretationTestSecondQuestionView: View {
    let viewModel: InterpretationTestViewModel
    let onSelection: (Bool) -> Void
    
    @State private var isButtonDisabled = false
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack(spacing: 96) {
            Text(viewModel.interpretationQuestions[0].secondQuestion)
                .robotoRegularFont(size: 16)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
            
            HStack(spacing: 96) {
                Button(action: {
                    handleSelection(isCorrect: viewModel.interpretationQuestions[0].secondQuestionAnswer == .yes)
                }, label: {
                    Text(AppStrings.interpretationTestYes)
                })
                .frame(width: 96, height: 48)
                .primaryActiveButtonStyle()
                .disabled(isButtonDisabled)
                
                Button(action: {
                    handleSelection(isCorrect: viewModel.interpretationQuestions[0].secondQuestionAnswer == .no)
                }, label: {
                    Text(AppStrings.interpretationTestNo)
                })
                .frame(width: 96, height: 48)
                .primaryActiveButtonStyle()
                .disabled(isButtonDisabled)
            }
            .foregroundStyle(.colorWhite)
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
        onSelection(isCorrect)
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
    ZStack {
        Color(.colorBackground)
            .ignoresSafeArea()
        InterpretationTestSecondQuestionView(viewModel: InterpretationTestViewModel(),
                                             onSelection: { _ in })
    }
}
