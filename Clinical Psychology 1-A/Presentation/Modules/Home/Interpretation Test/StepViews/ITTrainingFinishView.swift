//
//  ITTrainingFinishView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 12.01.2025.
//

import SwiftUI

struct ITTrainingFinishView: View {
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.itTrainingFinishDescription)
                .robotoRegularFont(size: 16)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
            Spacer()
            
            Button(action: onNext) {
                Text(AppStrings.itTrainingFinishButtonText)
            }
            .primaryActiveButtonStyle()
            .padding(.bottom, 36)
        }
    }
}

#Preview {
    ZStack {
        Color(.colorBackground)
            .ignoresSafeArea()
        ITTrainingFinishView(onNext: {})
    }
}
