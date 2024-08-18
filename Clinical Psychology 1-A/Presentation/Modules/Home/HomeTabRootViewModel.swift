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
    
    @Published var welcomeMessage: String = "Hoş geldiniz. Uygulamaya başlamadan önce gelin önemli birkaç konuyu tekrar hatırlayalım. Öncelikle sessiz bir ortama geçin. Bulunduğunuz ortamın ne çok sıcak ne de çok soğuk olmamasına dikkat edin. Uygulama sırasında cep telefonunuzun sesini kısın ve diğer uygulamalarınızın bildirimlerini kapatın. Bir başkasının bulunduğunuz ortama aniden girmeyeceğinden emin olun. Yine uygulama sırasında herhangi bir yiyecek ve içecek tüketmeyin. Rahat ve sabit bir sandalyeye sırtınız dik ve ayaklarınız zemine sağlam basacak şekilde ve kollarınızın boşlukta kalmayacağı bir pozisyonda (masa başında) oturun.  Cep telefonunuzun ekranının üst kenarının, gözünüzün hizasında ya da biraz altında olmasına dikkat edin.  Ekran-göz uzaklığınız 40-50 santim aralığında olmalıdır. Ekran ve gözünüz arasında 40-50 cm aralığında bir mesafe olacak şekilde duruşunuzu ayarlayın. Ekran yüzeyinde yansımaların oluşmaması için pencereleri ve yapay ışık kaynaklarını kendinize uygun şekilde konumlandırın.  Hazırsanız aşağıda yer alan butona tıklayın ve uygulamaya başlayın."
    
    @Published var generalTestButton: String = "Testlere Başla"
    
    @Published var cautionTestName: String = "Dikkat Yanlılığı Değişimleme"
    @Published var interpretationTestName: String = "Yorumlama Yanlılığı Değişimleme"
    
    var cautionTestStyle: CustomButtonStyle = PrimaryActiveButtonStyle()
    var interpretationTestStyle: CustomButtonStyle = PrimaryActiveButtonStyle()
}
