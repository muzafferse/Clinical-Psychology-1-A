//
//  ITWelcomeView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 22.09.2024.
//

import SwiftUI

struct ITWelcomeView: View {
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.itWelcomeMessage)
                .robotoRegularFont(size: 16)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
            
            Spacer()
            
            Button(action: onNext) {
                Text(AppStrings.itWelcomeButtonText)
            }
            .primaryActiveButtonStyle()
            .padding(.bottom, 36)
        }
    }
}

#Preview {
    ITWelcomeView(onNext: {})
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
}
