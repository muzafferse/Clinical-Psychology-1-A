//
//  PatientInfoTextFieldView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct PatientInfoTextFieldView: View {
    @Binding var text: String
    @Binding var patientInfoTextFieldStyle: CustomTextFieldStyle
    var onRightButtonTap: (() -> Void)?
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        BackgroundView(content: {
            HStack {
                if let leftIcon = patientInfoTextFieldStyle.leftIcon,
                   let leftEmptyIcon = patientInfoTextFieldStyle.leftEmptyIcon {
                    
                    text.isEmpty ? coloredIcon(icon: leftEmptyIcon) : coloredIcon(icon: leftIcon)
                }
                if patientInfoTextFieldStyle.isHidden {
                    SecureField("", text: $text)
                        .font(.custom(.roboto, style: .medium, size: 13))
                        .foregroundStyle(.colorPrimary)
                        .autocorrectionDisabled()
                        .focused($isFocused)
                } else {
                    TextField("", text: $text)
                        .font(.custom(.roboto, style: .medium, size: 13))
                        .foregroundStyle(.colorPrimary)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .focused($isFocused)
                }
                
                if let rightIcon = patientInfoTextFieldStyle.rightIcon,
                   let rightTransparentIcon = patientInfoTextFieldStyle.rightTransparentIcon {
                    Button {
                        onRightButtonTap?()
                    } label: {
                        patientInfoTextFieldStyle.isHidden ? coloredIcon(icon: rightTransparentIcon) : coloredIcon(icon: rightIcon)
                    }
                }
            }
        },
                       height: 48)
        .onTapGesture {
            isFocused = true
        }
    }
    
    func coloredIcon(icon: Image) -> some View {
        icon
            .foregroundStyle(.colorPrimary)
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        Color(.colorBackground)
            .ignoresSafeArea()
        VStack(spacing: 8) {
            PatientInfoTextFieldView(text: .constant("deneme"),
                                     patientInfoTextFieldStyle: .constant(UsernameTextFieldStyle()))
        }
        .padding(.horizontal, 8)
    }
}
