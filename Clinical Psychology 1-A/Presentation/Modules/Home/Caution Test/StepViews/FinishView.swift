//
//  FinishView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct FinishView: View {
    let viewModel: CautionTestViewModel
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            Text(AppStrings.ctFinishDescription)
                .robotoRegularFont(size: 16)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
            Spacer()
            
            Button(action: {
                self.appState.homeNavigation.append(HomeNavDestination.interpretationTest)
            }, label: {
                Text(AppStrings.ctFinishButtonText)
            })
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
    FinishView(viewModel: CautionTestViewModel())
}
