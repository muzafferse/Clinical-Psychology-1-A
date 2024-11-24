//
//  InterpretationTestQuestionDescriptionView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 10.11.2024.
//

import SwiftUI

struct InterpretationTestQuestionDescriptionView: View {
    let viewModel: InterpretationTestViewModel
    let onNext: () -> Void
    
    @State private var isGestureEnabled: Bool = false
    
    var body: some View {
        ZStack {
            Color(.colorBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                Text(viewModel.interpretationQuestions[0].questionDescription)
                    .robotoRegularFont(size: 16)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.colorWhite)
            }
        }
        .onTapGesture {
            if isGestureEnabled {
                onNext()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                isGestureEnabled = true
            }
        }
    }
}

#Preview {
    ZStack {
        Color(.colorBackground)
            .ignoresSafeArea()
        InterpretationTestQuestionDescriptionView(viewModel: InterpretationTestViewModel(),
                                                  onNext: {})
    }
}
