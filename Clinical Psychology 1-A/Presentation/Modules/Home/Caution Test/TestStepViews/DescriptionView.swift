//
//  DescriptionView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct DescriptionView: View {
    let viewModel: CautionTestViewModel
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 36) {
            Spacer()
            
            Text(viewModel.startDescription)
                .robotoRegularFont(size: 16)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
            
            Spacer()
            
            Button(action: onNext) {
                Text(viewModel.startButtonText)
            }
            .buttonStyle(.customButton(.constant(PrimaryActiveButtonStyle())))
            .padding(.bottom, 36)
        }
    }
}

#Preview {
    DescriptionView(viewModel: CautionTestViewModel(),
                    onNext: {})
}
