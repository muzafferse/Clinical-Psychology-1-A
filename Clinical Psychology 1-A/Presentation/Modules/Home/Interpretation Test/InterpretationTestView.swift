//
//  InterpretationTestView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 15.05.2024.
//

import SwiftUI

struct InterpretationTestView: View {
    @ObservedObject var viewModel = InterpretationTestViewModel()
    @State var selectedStep: InterpretationTestStep = .welcomeMessage
    @State private var answer: String = ""
    @State private var isSecondQuestionCorrect: Bool = false
    
    var body: some View {
        ZStack {
            Color(.colorBackground)
                .ignoresSafeArea()
            
            VStack {
                switch selectedStep {
                case .welcomeMessage:
                    InterpretationTestWelcomeView(viewModel: viewModel) {
                        selectedStep = .trainingDescription
                    }
                    
                case .trainingDescription:
                    InterpretationTestTrainingDescriptionView(viewModel: viewModel) {
                        selectedStep = .questionDescription
                    }
                    
                case .questionDescription:
                    InterpretationTestQuestionDescriptionView(viewModel: viewModel) {
                        selectedStep = .firstQuestion
                    }
                    
                case .firstQuestion:
                    InterpretationTestFirstQuestionView(viewModel: viewModel, answer: $answer) {
                        selectedStep = .secondQuestion
                    }
                    
                case .secondQuestion:
                    InterpretationTestSecondQuestionView(viewModel: viewModel) { isCorrect in
                        isSecondQuestionCorrect = isCorrect
                        selectedStep = .secondQuestionResult
                    }
                    
                case .secondQuestionResult:
                    InterpretationTestSecondQuestionResultView(isCorrect: isSecondQuestionCorrect) {
                        selectedStep = .finish
                    }
                    
                case .finish:
                    Text("AAA")
                }
            }
            .padding(.horizontal, 24)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    InterpretationTestView()
}
