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
    
    @State private var isButtonDisabled = false
    
    var body: some View {
        let (_, _, direction, position) = viewModel.currentTrial
        ZStack {
            VStack(spacing: 32) {
                if position == .topNeutral {
                    arrowFrameView(direction: direction)
                    
                    Spacer()
                        .frame(width: 256, height: 192)
                } else {
                    Spacer()
                        .frame(width: 256, height: 192)
                    
                    arrowFrameView(direction: direction)
                }
            }
            
            selectionButtonsView(onSelection: onSelection)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
    }
    
    private func arrowFrameView(direction: ArrowDirection) -> some View {
        ZStack {
            Spacer().frame(width: 256, height: 192)
            VStack {
                if direction == .right {
                    Image.rightArrowIcon
                        .robotoRegularFont(size: 32)
                        .foregroundStyle(.colorWhite)
                } else {
                    Image.leftArrowIcon
                        .robotoRegularFont(size: 32)
                        .foregroundStyle(.colorWhite)
                }
            }
        }
    }
    
    private func selectionButtonsView(onSelection: @escaping () -> Void) -> some View {
        HStack {
            Button(action: {
                onSelection()
                isButtonDisabled = true
            }, label: {
                Image.leftArrowIcon
            })
            .frame(width: 64, height: 32)
            .primaryActiveButtonStyle()
            .disabled(isButtonDisabled)
            
            Spacer()
            
            Button(action: {
                onSelection()
                isButtonDisabled = true
            }, label: {
                Image.rightArrowIcon
            })
            .frame(width: 64, height: 32)
            .primaryActiveButtonStyle()
            .disabled(isButtonDisabled)
        }
    }
}

#Preview {
    SelectionView(viewModel: CautionTestViewModel(),
                  onSelection: {})
}
