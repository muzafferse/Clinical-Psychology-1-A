//
//  ITTrainingDescriptionView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 22.09.2024.
//

import SwiftUI

struct ITTrainingDescriptionView: View {
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.itTrainingDescription)
                .robotoRegularFont(size: 16)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
            
            Spacer()
            
            Button(action: onNext) {
                Text(AppStrings.itTrainingButtonText)
            }
            .primaryActiveButtonStyle()
            .padding(.bottom, 36)
        }
    }
}

#Preview {
    ITTrainingDescriptionView(onNext: {})
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
}
