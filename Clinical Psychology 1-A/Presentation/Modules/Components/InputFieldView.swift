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
                .font(.custom(.roboto, style: .medium, size: 14))
                .foregroundStyle(.colorWhite)
            
            PatientInfoTextFieldView(text: $text,
                                     patientInfoTextFieldStyle: .constant(textFieldStyle))
        }
    }
}

#Preview {
    InputFieldView(title: "",
                   text: .constant(""),
                   textFieldStyle: UsernameTextFieldStyle())
}
