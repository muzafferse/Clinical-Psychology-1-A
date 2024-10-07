//
//  InterpretationTestView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 15.05.2024.
//

import SwiftUI

struct InterpretationTestView: View {
    
    @ObservedObject var viewModel = InterpretationTestViewModel()
    @State var selectedStep: InterpretationTestStep = .trainingWelcomeMessage
    
    var body: some View {
        ZStack {
            Color(.colorBackground)
                .ignoresSafeArea()
            
            VStack {
                switch selectedStep {
                case .trainingWelcomeMessage:
                    InterpretationTestTrainingWelcomeView(viewModel: viewModel) {
                        selectedStep = .trainingDescription
                    }
                    
                case .trainingDescription:
                    InterpretationTestTrainingDescriptionView(viewModel: viewModel) {
                        
                    }
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
