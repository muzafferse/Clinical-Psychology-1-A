//
//  InputFieldView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 3.06.2024.
//

import SwiftUI

struct InputFieldView: View {
    var title: String
    @Binding var text: String
    var textFieldStyle: CustomTextFieldStyle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .robotoMediumFont(size: 14)
                .foregroundStyle(.colorWhite)
            
            LoginTextFieldView(text: $text,
                               loginTextFieldStyle: .constant(textFieldStyle))
        }
    }
}

#Preview {
    InputFieldView(title: AppStrings.nickName,
                   text: .constant(AppStrings.nickName),
                   textFieldStyle: UsernameTextFieldStyle())
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(
        Color(.colorBackground)
            .ignoresSafeArea()
    )
}
