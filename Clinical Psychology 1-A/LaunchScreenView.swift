//
//  LaunchScreenView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

struct LaunchScreenView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color(.colorBackground)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image(.logo)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                
                Spacer()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        isPresented = false
                    }
                }
            }
        }
    }
}

#Preview {
    LaunchScreenView(isPresented: .constant(true))
}
