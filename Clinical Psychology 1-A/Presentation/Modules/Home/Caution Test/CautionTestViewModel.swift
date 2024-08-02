//
//  CautionTestViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 28.04.2024.
//

import SwiftUI

class CautionTestViewModel: ObservableObject {
    
    @Published var startDescription: String = "Bu çalışmada ekranda karşınıza bazı fotoğraf ve fotoğraf çiftleri çıkacak. Lütfen tüm dikkatinizi ekrandaki fotoğraf ve fotoğraf çiftlerine veriniz. Fotoğraflar ekrana gelip çok kısa bir süre ekranda kalacak ve sonra kaybolacak. Fotoğrafların kaybolmasının hemen ardından bir sonraki ekranda karşınıza sağ ok (→) ya da sol ok (←) şekillerinden biri çıkacak. Eğer ekranda karşınıza çıkan şekil sağ ok (→) ise bu şekil ile uyumlu olan sağ ok (→) butonuna, karşınıza çıkan şekil sol ok (←) ise bu şekil ile uyumlu olan sol ok (←) butonuna basmanız gerekmektedir. Lütfen ekranda gördüğünüz şekle denk gelen butona mümkün olduğunca hızlı bir şekilde basınız. Bir deneme bittikten sonra diğer denemeye başlamadan önce ekranda kısa bir süre belirecek olan bir artı (+) işareti göreceksiniz. Bu işaret ekranda çok kısa bir süre kalacağı için bütün dikkatinizi bu ekrana vermeniz önemlidir."
    @Published var startButtonText: String = "Hazırsanız çalışmaya başlamak için butona tıklayın"
    
    @Published var finishDescription = "Tebrikler, 'Dikkat Yanlılığı Değişimleme' testini tamamladınız. Aşağıdaki butona tıklayarak 'Yorumlama Yanlılığı Değişimleme' testine başlayabilirsiniz."
    @Published var finishButtonText = "'Yorumlama Yanlılığı Değişimleme' testine başlamak için butona tıklayın"
    
    @Published var plusIcon = Image(systemName: "plus")
    @Published var leftArrowIcon = Image(systemName: "arrow.left")
    @Published var rightArrowIcon = Image(systemName: "arrow.right")
    
    @Published var photos = [
        Image(.CE_1),
        Image(.neutral1),
        Image(.CE_2),
        Image(.neutral2),
        Image(.CE_3),
        Image(.neutral3),
        Image(.CE_4),
        Image(.neutral4),
        Image(.CE_5),
        Image(.neutral5),
        Image(.CE_6),
        Image(.neutral6),
        Image(.CE_7),
        Image(.neutral7),
        Image(.CE_8),
        Image(.neutral8),
        Image(.CE_9),
        Image(.neutral9),
        Image(.CE_10),
        Image(.neutral10),
        Image(.CE_11),
        Image(.neutral11),
        Image(.CE_12),
        Image(.neutral12)
    ]
}
