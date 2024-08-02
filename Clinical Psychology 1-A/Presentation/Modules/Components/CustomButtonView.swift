//
//  CustomButtonView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct CustomButtonView: ButtonStyle {
    @Binding var buttonType: CustomButtonStyle
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(buttonType.foregroundColor)
            .font(buttonType.font)
            .underline(buttonType.hasUnderline)
            .multilineTextAlignment(.center)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .background(buttonType.backgroundColor)
            .cornerRadius(buttonType.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: buttonType.cornerRadius)
                    .stroke(buttonType.strokeColor,
                            lineWidth: 1))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeOut(duration: 0.5),
                       value: configuration.isPressed)
    }
}

#Preview {
    ZStack {
        Color(.colorWhite)
            .ignoresSafeArea()
        
        HStack {
            VStack(spacing: 32) {
                Button(action: { },
                       label: {
                    Text("Primary Button")
                })
                .buttonStyle(.customButton(.constant(PrimaryActiveButtonStyle())))
                
                Button(action: { },
                       label: {
                    Text("Primary Inactive Button")
                })
                .buttonStyle(.customButton(.constant(PrimaryInactiveButtonStyle())))
                .disabled(true)
            }
        }
        .padding(.horizontal)
    }
}
