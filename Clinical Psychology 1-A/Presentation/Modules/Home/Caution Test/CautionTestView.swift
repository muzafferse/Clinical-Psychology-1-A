//
//  CautionTestView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 28.04.2024.
//

import SwiftUI

struct CautionTestView: View {
    
    @ObservedObject var viewModel = CautionTestViewModel()
    @State var selectedStep: CautionTestStep = .description
    @State var trialCount: Int = 0
    
    var body: some View {
        ZStack {
            Color(.colorBackground)
                .ignoresSafeArea()
            
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
                                selectedStep = .photos
                            }
                        }
                    
                case .photos:
                    PhotosView(viewModel: viewModel)
                        .onAppear {
                            Task {
                                try await Task.sleep(for: 0.5)
                                selectedStep = .selection
                            }
                        }
                    
                case .selection:
                    SelectionView(viewModel: viewModel) {
                        viewModel.currentTrialIndex += 1
                        if viewModel.currentTrialIndex >= viewModel.totalTrials.count {
                            selectedStep = .finish
                        } else {
                            selectedStep = .plusSign
                        }
                    }
                    
                case .finish:
                    FinishView(viewModel: viewModel)
                }
            }
            .padding(.horizontal, 24)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CautionTestView()
}
