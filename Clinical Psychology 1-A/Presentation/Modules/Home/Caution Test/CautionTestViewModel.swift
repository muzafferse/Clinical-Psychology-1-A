//
//  CautionTestViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 28.04.2024.
//

import SwiftUI

class CautionTestViewModel: ObservableObject {
    
    @Published var startDescription: String = "Bu çalışmada ekranda karşınıza bazı fotoğraf ve fotoğraf çiftleri çıkacak. Lütfen tüm dikkatinizi ekrandaki fotoğraf ve fotoğraf çiftlerine veriniz. Fotoğraflar ekrana gelip çok kısa bir süre ekranda kalacak ve sonra kaybolacak. Fotoğrafların kaybolmasının hemen ardından bir sonraki ekranda karşınıza sağ ok (→) ya da sol ok (←) şekillerinden biri çıkacak. Eğer ekranda karşınıza çıkan şekil sağ ok (→) ise ekranın ortasında karşınıza çıkacak olan bu şekil ile uyumlu olan sağ ok (→) butonuna, karşınıza çıkan şekil sol ok (←) ise bu şekil ile uyumlu olan sol ok (←) butonuna basmanız gerekmektedir. Lütfen ekranda gördüğünüz şekle denk gelen butona mümkün olduğunca hızlı bir şekilde basınız. Bir deneme bittikten sonra diğer denemeye başlamadan önce ekranda kısa bir süre belirecek olan bir artı (+) işareti göreceksiniz. Bu işaret ekranda çok kısa bir süre kalacağı için bütün dikkatinizi bu ekrana vermeniz önemlidir. Hazırsanız çalışmaya başlamak için aşağıdaki BAŞLAT yazılı butona basın."
    @Published var startButtonText: String = "BAŞLAT"
    
    @Published var finishDescription = "Çalışma bitti. Sonlandırmak ve diğer adıma geçmek için aşağıdaki BİTİR VE DİĞER ADIMA GEÇ yazılı butona basın."
    @Published var finishButtonText = "BİTİR VE DİĞER ADIMA GEÇ"
    
    @Published var plusIcon = Image(systemName: "plus")
    @Published var leftArrowIcon = Image(systemName: "arrow.left")
    @Published var rightArrowIcon = Image(systemName: "arrow.right")
    
    @Published var photos = [
        Image(.OCB_1),
        Image(.neutral1),
        Image(.OCB_2),
        Image(.neutral2),
        Image(.OCB_3),
        Image(.neutral3),
        Image(.OCB_4),
        Image(.neutral4),
        Image(.OCB_5),
        Image(.neutral5),
        Image(.OCB_6),
        Image(.neutral6),
        Image(.OCB_7),
        Image(.neutral7),
        Image(.OCB_8),
        Image(.neutral8),
        Image(.OCB_9),
        Image(.neutral9),
        Image(.OCB_10),
        Image(.neutral10),
        Image(.OCB_11),
        Image(.neutral11),
        Image(.OCB_12),
        Image(.neutral12)
    ]
}
