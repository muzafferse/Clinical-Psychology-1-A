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
        VStack(spacing: 30) {
            viewModel.rightArrowIcon
                .font(.custom(.roboto, style: .regular, size: 32))
                .foregroundStyle(.colorWhite)
            
            HStack(spacing: 20) {
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
