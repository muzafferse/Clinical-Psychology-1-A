//
//  ITSessionFinishView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 13.01.2025.
//

import SwiftUI

struct ITSessionFinishView: View {
    //TODO: Add Completion
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.itFinishDescription)
                .robotoRegularFont(size: 16)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text(AppStrings.itFinishButtonText)
            })
            .primaryActiveButtonStyle()
            .padding(.bottom, 36)
        }
    }
}

#Preview {
    ITSessionFinishView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
}
