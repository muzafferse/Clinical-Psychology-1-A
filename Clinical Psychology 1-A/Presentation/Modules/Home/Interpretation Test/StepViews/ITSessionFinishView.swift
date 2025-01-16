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
                .regularTextStyle(size: 16)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text(AppStrings.itFinishButtonText)
            })
            .primaryActiveButtonStyle()
            .padding(.bottom, 36)
        }
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    ITSessionFinishView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
}
