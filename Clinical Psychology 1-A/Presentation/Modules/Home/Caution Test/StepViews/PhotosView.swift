//
//  PhotosView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct PhotosView: View {
    let viewModel: CautionTestViewModel
    
    var body: some View {
        let (ocdPhoto, neutralPhoto, _, position) = viewModel.currentTrial
        VStack(spacing: 32) {
            if position == .topNeutral {
                neutralPhoto
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 192)
                
                ocdPhoto
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 192)
                
            } else {
                ocdPhoto
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 192)
                
                neutralPhoto
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 192)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    PhotosView(viewModel: CautionTestViewModel())
}
