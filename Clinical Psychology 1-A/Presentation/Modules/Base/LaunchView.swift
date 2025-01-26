//
//  LaunchView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 25.01.2025.
//

import SwiftUI

struct LaunchView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Image(.splash)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.colorBackground
            .ignoresSafeArea()
        )
        .onAppear {
            presentHome()
        }
    }
    
    private func presentHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isPresented = true
        }
    }
}

#Preview {
    LaunchView(isPresented: .constant(false))
}
