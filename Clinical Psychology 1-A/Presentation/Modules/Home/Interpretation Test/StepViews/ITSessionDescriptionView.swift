//
//  ITSessionDescriptionView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 12.01.2025.
//

import SwiftUI

struct ITSessionDescriptionView: View {
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.itStartDescription)
                .robotoRegularFont(size: 16)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
            
            Spacer()
            
            Button(action: onNext) {
                Text(AppStrings.itStartButtonText)
            }
            .primaryActiveButtonStyle()
            .padding(.bottom, 36)
        }
    }
}

#Preview {
    ITSessionDescriptionView(onNext: {})
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
}
