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
        ZStack {
            VStack(spacing: 32) {
                Spacer()
                    .frame(width: 256, height: 192)
                
                ZStack {
                    Spacer()
                        .frame(width: 256, height: 192)
                    
                    VStack {
                        viewModel.rightArrowIcon
                            .robotoRegularFont(size: 32)
                            .foregroundStyle(.colorWhite)
                    }
                }
            }
            
            HStack {
                Button(action: onSelection) {
                    viewModel.leftArrowIcon
                }
                .frame(width: 64, height: 32)
                .buttonStyle(.customButton(.constant(PrimaryActiveButtonStyle())))
                
                Spacer()
                
                Button(action: onSelection) {
                    viewModel.rightArrowIcon
                }
                .frame(width: 64, height: 32)
                .buttonStyle(.customButton(.constant(PrimaryActiveButtonStyle())))
            }
        }
    }
}

#Preview {
    SelectionView(viewModel: CautionTestViewModel(), onSelection: {})
}
