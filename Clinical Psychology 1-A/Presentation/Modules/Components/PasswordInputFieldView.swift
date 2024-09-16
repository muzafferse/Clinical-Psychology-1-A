//
//  PasswordInputFieldView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 3.06.2024.
//

import SwiftUI

struct PasswordInputFieldView: View {
    var title: String
    @Binding var text: String
    @Binding var textFieldStyle: CustomTextFieldStyle
    var toggleAction: () -> Void
    var warningMessage: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .robotoMediumFont(size: 14)
                .foregroundStyle(.colorWhite)
            
            PatientInfoTextFieldView(text: $text,
                                     patientInfoTextFieldStyle: $textFieldStyle,
                                     onRightButtonTap: toggleAction)
            
            if let warningMessage = warningMessage {
                Text(warningMessage)
                    .robotoRegularFont(size: 12)
                    .foregroundColor(.red)
            }
        }
        .animation(.easeInOut, value: warningMessage)
    }
}

#Preview {
    ZStack {
        Color(.colorBackground)
            .ignoresSafeArea()
        PasswordInputFieldView(title: AppStrings.password,
                               text: .constant(AppStrings.password),
                               textFieldStyle: .constant(PasswordTextFieldStyle()),
                               toggleAction: {})
    }
}
