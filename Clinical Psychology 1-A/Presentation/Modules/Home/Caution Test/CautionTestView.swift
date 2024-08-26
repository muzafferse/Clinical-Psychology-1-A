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
    @State var photoCoupleCount: Int = 0
    
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
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                selectedStep = .photos
                            }
                        }
                    
                case .photos:
                    PhotosView(viewModel: viewModel, photoCoupleCount: photoCoupleCount)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                selectedStep = .selection
                            }
                        }
                    
                case .selection:
                    SelectionView(viewModel: viewModel) {
                        photoCoupleCount += 2
                        if photoCoupleCount >= viewModel.photos.count {
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
