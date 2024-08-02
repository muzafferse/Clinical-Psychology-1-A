//
//  InterpretationTestView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 15.05.2024.
//

import SwiftUI

struct InterpretationTestView: View {
    
    @ObservedObject var viewModel = InterpretationTestViewModel()
    
    var body: some View {
        ZStack {
            Color(.colorBackground)
                .ignoresSafeArea()
            
            Text("Hello, World!")
                .font(.custom(.roboto, style: .regular, size: 16))
                .multilineTextAlignment(.leading)
                .foregroundStyle(.colorWhite)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    InterpretationTestView()
}
