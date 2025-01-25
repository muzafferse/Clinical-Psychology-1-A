//
//  CautionTestView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 28.04.2024.
//

import SwiftUI

struct CautionTestView: View {
    @ObservedObject var viewModel = CautionTestViewModel()
    @State var selectedStep: CTStep = .description
    @State var trialCount: Int = 0
    
    var body: some View {
        VStack {
            switch selectedStep {
            case .description:
                DescriptionView(viewModel: viewModel) {
                    selectedStep = .plusSign
                }
                
            case .plusSign:
                PlusSignView(viewModel: viewModel)
                    .onAppear {
                        Task {
                            try await Task.sleep(for: 0.5)
                            await MainActor.run {
                                selectedStep = .photos
                            }
                            
                        }
                    }
                
            case .photos:
                PhotosView(viewModel: viewModel)
                    .onAppear {
                        Task {
                            try await Task.sleep(for: 0.5)
                            await MainActor.run {
                                selectedStep = .selection
                            }
                        }
                    }
                
            case .selection:
                SelectionView(viewModel: viewModel) {
                    if viewModel.currentTrialIndex >= viewModel.totalTrials.count - 1 {
                        selectedStep = .finish
                    } else {
                        viewModel.currentTrialIndex += 1
                        selectedStep = .plusSign
                    }
                }
                
            case .finish:
                FinishView(viewModel: viewModel)
            }
        }
        .padding(.horizontal, 24)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CautionTestView()
}
