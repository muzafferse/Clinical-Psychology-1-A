//
//  PlusSignView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct PlusSignView: View {
    let viewModel: CautionTestViewModel
    
    var body: some View {
        Image.plusIcon
            .robotoRegularFont(size: 32)
            .foregroundStyle(.colorWhite)
    }
}

#Preview {
    PlusSignView(viewModel: CautionTestViewModel())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
}
