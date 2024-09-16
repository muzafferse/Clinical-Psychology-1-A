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
        let (_, _, direction, position) = viewModel.currentTrial
        ZStack {
            VStack(spacing: 32) {
                if position == .topNeutral {
                    ZStack {
                        Spacer()
                            .frame(width: 256, height: 192)
                        
                        VStack {
                            if direction == .right {
                                viewModel.rightArrowIcon
                                    .robotoRegularFont(size: 32)
                                    .foregroundStyle(.colorWhite)
                            } else {
                                viewModel.leftArrowIcon
                                    .robotoRegularFont(size: 32)
                                    .foregroundStyle(.colorWhite)
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(width: 256, height: 192)
                } else {
                    Spacer()
                        .frame(width: 256, height: 192)
                    
                    ZStack {
                        Spacer()
                            .frame(width: 256, height: 192)
                        
                        VStack {
                            if direction == .right {
                                viewModel.rightArrowIcon
                                    .robotoRegularFont(size: 32)
                                    .foregroundStyle(.colorWhite)
                            } else {
                                viewModel.leftArrowIcon
                                    .robotoRegularFont(size: 32)
                                    .foregroundStyle(.colorWhite)
                            }
                        }
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
