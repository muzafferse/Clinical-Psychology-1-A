//
//  HomeTabRootViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import Foundation

//MARK: - View Model
// ViewModel responsible for managing data related to the Home dashboard
class HomeTabRootViewModel: ObservableObject, Identifiable {
    
    // MARK: - Properties
    @Published var title: String = "Testler"
    
    @Published var warningMessage: String = "Klinik Psikoloji Uygulamasına Hoş Geldiniz! Lütfen bu açıklamayı dikkatlice okuyunuz. 'Testlere Başla' butonuna tıkladıktan sonra önce 'Dikkat Yanlılığı Değişimleme' sonrasında 'Yorumlama Yanlılığı Değişimleme' testini çözeceksiniz. Her bir testten önce o testi nasıl yapmanız gerektiğine dair bir protokol göreceksiniz. Lütfen bu protokolleri dikkatlice okuyunuz."
    
    @Published var generalTestButton: String = "Testlere Başla"
    
    @Published var cautionTestName: String = "Dikkat Yanlılığı Değişimleme"
    @Published var interpretationTestName: String = "Yorumlama Yanlılığı Değişimleme"
    
    var cautionTestStyle: CustomButtonStyle = PrimaryActiveButtonStyle()
    var interpretationTestStyle: CustomButtonStyle = PrimaryActiveButtonStyle()
}
