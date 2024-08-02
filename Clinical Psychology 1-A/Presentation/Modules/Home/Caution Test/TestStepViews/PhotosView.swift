//
//  PhotosView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct PhotosView: View {
    let viewModel: CautionTestViewModel
    let photoCoupleCount: Int
    
    var body: some View {
        VStack(spacing: 30) {
            viewModel.photos[photoCoupleCount]
                .resizable()
                .scaledToFit()
                .frame(width: 256, height: 192)
                .border(.colorWhite)
            
            viewModel.photos[photoCoupleCount + 1]
                .resizable()
                .scaledToFit()
                .frame(width: 256, height: 192)
                .border(.colorWhite)
        }
    }
}

#Preview {
    PhotosView(viewModel: CautionTestViewModel(), photoCoupleCount: 0)
}
