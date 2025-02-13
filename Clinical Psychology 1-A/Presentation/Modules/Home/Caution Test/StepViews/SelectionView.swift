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
        let trial = viewModel.currentTrial
        ZStack {
            VStack(spacing: 32) {
                if trial.position == .topNeutral {
                    arrowFrameView(direction: trial.direction)
                    
                    Spacer()
                        .frame(width: 256, height: 192)
                } else {
                    Spacer()
                        .frame(width: 256, height: 192)
                    
                    arrowFrameView(direction: trial.direction)
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
                        .regularTextStyle(size: 32)
                } else {
                    Image.leftArrowIcon
                        .regularTextStyle(size: 32)
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
                  onSelection: { _,_ in })
}
