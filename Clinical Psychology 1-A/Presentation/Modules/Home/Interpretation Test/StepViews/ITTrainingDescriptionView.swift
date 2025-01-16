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
                .regularTextStyle(size: 16)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Button(action: onNext) {
                Text(AppStrings.itTrainingButtonText)
            }
            .primaryActiveButtonStyle()
            .padding(.bottom, 36)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    ITTrainingDescriptionView(onNext: {})
}
