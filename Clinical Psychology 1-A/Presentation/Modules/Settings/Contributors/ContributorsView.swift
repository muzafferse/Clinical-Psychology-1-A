//
//  ContributorsView.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct ContributorsView: View {
    @ObservedObject var viewModel = ContributorsViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(.colorBackground)
                .ignoresSafeArea()
            
            List(viewModel.contributorsData) { contributor in
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(contributor.name) \(contributor.surname)")
                            .font(.custom(.roboto, style: .medium, size: 16))
                            .foregroundStyle(.colorWhite)
                        
                        Text(contributor.title)
                            .font(.custom(.roboto, style: .regular, size: 14))
                            .foregroundStyle(.colorWhite)
                        
                        Text(contributor.company)
                            .font(.custom(.roboto, style: .regular, size: 14))
                            .foregroundStyle(.colorWhite)
                    }
                    .padding(.vertical, 10)
                    
                    Spacer()
                    
                    if let encodedEmail = contributor.email.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                       let mailURL = URL(string: "mailto:\(encodedEmail)") {
                        Link(destination: mailURL) {
                            VStack(alignment: .center, spacing: 5) {
                                viewModel.mailIcon
                                    .font(.custom(.roboto, style: .regular, size: 32))
                                    .foregroundStyle(.colorWhite)
                                
                                Text(viewModel.contactText)
                                    .font(.custom(.roboto, style: .regular, size: 14))
                                    .foregroundStyle(.colorWhite)
                            }
                        }
                    }
                }
                .listRowBackground(Color.colorBackground)
                .listRowSeparatorTint(.colorInactive)
            }
            .listStyle(.plain)
        }
        .navigationTitle(viewModel.title)
        .navigationBarTitleTextColor(.colorWhite)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        viewModel.chevronLeft
                            .foregroundStyle(.colorWhite)
                        Text(viewModel.backButtonTitle)
                            .foregroundStyle(.colorWhite)
                    }
                }
            }
        }
    }
}

#Preview {
    ContributorsView()
}
