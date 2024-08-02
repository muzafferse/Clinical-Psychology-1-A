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
        
        
        VStack(spacing: 36) {
            Spacer()
            
            Text(viewModel.finishDescription)
                .font(.custom(.roboto, style: .regular, size: 16))
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
            
            Spacer()
            
            Button(action: {
                self.appState.homeNavigation.append(HomeNavDestination.interpretationTest)
            }, label: {
                Text(viewModel.finishButtonText)
            })
            .buttonStyle(.customButton(.constant(PrimaryActiveButtonStyle())))
            .padding(.bottom, 36)
        }
    }
}

#Preview {
    FinishView(viewModel: CautionTestViewModel())
}
