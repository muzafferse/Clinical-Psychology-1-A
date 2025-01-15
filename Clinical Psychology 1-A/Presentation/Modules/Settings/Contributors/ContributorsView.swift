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
        List(viewModel.contributorsData) { contributor in
            HStack {
                personInfoView(person: contributor)
                Spacer()
                emailView(person: contributor)
            }
            .listRowBackground(Color.colorBackground)
            .listRowSeparatorTint(.colorInactive)
        }
        .listStyle(.plain)
        .background(
            Color(.colorBackground)
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden()
        .navigationTitle(AppStrings.contributorsTitle)
        .navigationBarTitleTextColor(.colorWhite)
        .backButton(text: AppStrings.contributorsBackButtonText)
    }
}

extension ContributorsView {
    private func personInfoView(person: Contributor) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(person.name)
                .robotoMediumFont(size: 16)
                .foregroundStyle(.colorWhite)
            
            Text(person.title)
                .robotoRegularFont(size: 14)
                .foregroundStyle(.colorWhite)
            
            Text(person.company)
                .robotoRegularFont(size: 14)
                .foregroundStyle(.colorWhite)
        }
        .padding(.vertical, 10)
    }
    
    private func emailView(person: Contributor) -> some View {
        VStack {
            if let encodedEmail = person.email.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
               let mailURL = URL(string: "mailto:\(encodedEmail)") {
                Link(destination: mailURL) {
                    VStack(alignment: .center, spacing: 5) {
                        Image.mailIcon
                            .robotoRegularFont(size: 32)
                            .foregroundStyle(.colorWhite)
                        
                        Text(AppStrings.contactButtonText)
                            .robotoRegularFont(size: 14)
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
