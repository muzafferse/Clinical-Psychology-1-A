//
//  ContributorsViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 29.05.2024.
//

import SwiftUI

struct Contributor: Identifiable {
    let id: UUID = UUID()
    let name: String
    let surname: String
    let title: String
    let email: String
    let company: String
}

class ContributorsViewModel: ObservableObject, Identifiable {
    
    // MARK: - Properties
    @Published var contributorsData: [Contributor] = [
        Contributor(
            name: "Muzaffer",
            surname: "Sevili",
            title: "Proje Öğrencisi",
            email: "muzaffer@ieee.org",
            company: "Dokuz Eylül Üniversitesi"),
        
        Contributor(
            name: "Doç. Dr. Kökten Ulaş",
            surname: "Birant",
            title: "Proje Danışmanı - Akademisyen",
            email: "ulas@cs.deu.edu.tr",
            company: "Dokuz Eylül Üniversitesi"),
        
        Contributor(
            name: "Sıla",
            surname: "Derin",
            title: "Proje Danışmanı",
            email: "siladerin@gmail.com",
            company: "Dokuz Eylül Üniversitesi")
    ]
    
    @Published var mailIcon: Image = Image(systemName: "square.and.pencil")
    @Published var contactText: String = "İletişime Geç"
    @Published var title: String = "Katkıda Bulunanlar"
    
    @Published var chevronLeft = Image(systemName: "chevron.left")
    @Published var backButtonTitle: String = "Ayarlar"
}
