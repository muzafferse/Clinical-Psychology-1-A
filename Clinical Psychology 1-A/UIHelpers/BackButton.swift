//
//  BackButton.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 10.11.2024.
//

import SwiftUI

struct BackButton: ViewModifier {
    let text: String
    @Environment(\.dismiss) private var dismiss
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image.chevronLeft
                            Text(text)
                        }
                    }
                    .foregroundStyle(.colorWhite)
                }
            }
    }
}
