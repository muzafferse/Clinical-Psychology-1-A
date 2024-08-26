//
//  SelectionView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct SelectionView: View {
    let viewModel: CautionTestViewModel
    let onSelection: () -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            viewModel.rightArrowIcon
                .robotoRegularFont(size: 32)
                .foregroundStyle(.colorWhite)
            
            HStack(spacing: 24) {
                Button(action: onSelection) {
                    viewModel.leftArrowIcon
                }
                .buttonStyle(.customButton(.constant(PrimaryActiveButtonStyle())))
                
                Button(action: onSelection) {
                    viewModel.rightArrowIcon
                }
                .buttonStyle(.customButton(.constant(PrimaryActiveButtonStyle())))
            }
        }
    }
}

#Preview {
    SelectionView(viewModel: CautionTestViewModel(), onSelection: {})
}
