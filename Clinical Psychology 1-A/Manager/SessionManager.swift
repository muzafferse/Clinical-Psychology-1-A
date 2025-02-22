//
//  SessionManager.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 27.01.2025.
//

import SwiftUICore
import FirebaseFirestore
import FirebaseAuth

class SessionManager: ObservableObject {
    static let shared = SessionManager()
    
    var nickName: String = "Guest"
    @Published var sessionData: SessionData
    private let db = Firestore.firestore()
    
    private init() {
        self.sessionData = SessionData()
        Task {
            await initializeSession()
        }
    }
    
    func saveSessionData() {
        let userDocRef = db.collection("1A").document(nickName)
        let sessionKey = "Oturum-\(sessionData.sessionNumber)"
        
        let cautionTestData = sessionData.cautionTestData.map { data in
            return [
                "a. Tarih ve Saat": data.timeStamp,
                "b. Fotoğraf Çifti No": data.imagePairNo,
                "c. Nötr Fotoğraf Yeri": data.neutralPhotoPosition,
                "d. OKB Fotoğrafı Yeri": data.ocdPhotoPosition,
                "e. Okun Yönü": data.arrowDirection,
                "f. Okun Yeri": data.arrowPosition,
                "g. Verilen Yanıt": data.givenAnswer,
                "h. Yanıt Doğru Mu": data.isAnswerCorrect,
                "i. Tepki Süresi (ms)": data.responseTime
            ] as [String : Any]
        }
        
        let interpretationTestData = sessionData.interpretationTestData.map { data in
            return [
                "a. Tarih ve Saat": data.timeStamp,
                "b. Soru Açıklaması": data.questionDescription,
                "c. Tür": data.category,
                "d. Boşluklu Soru": data.firstQuestion,
                "e. Boşluklu Sorunun Cevabı": data.firstQuestionAnswer,
                "f. Boşluklu Soruya Verilen Cevap": data.givenFirstQuestionAnswer,
                "g. Tepki Süresi (Boşluk Doldurma) (ms)": data.firstQuestionResponseTime,
                "h. Soru": data.secondQuestion,
                "i. Sorunun Cevabı": data.secondQuestionAnswer,
                "j. Soruya Verilen Cevap": data.givenSecondQuestionAnswer,
                "k. Cevabın Doğru Olup Olmadığı": data.isSecondQuestionAnswerCorrect,
                "l. Geri Bildirim": data.feedback,
                "m. Tepki Süresi (ms)": data.secondQuestionResponseTime
            ] as [String : Any]
        }
        
        let sessionDataDict: [String: Any] = [
            sessionKey: [
                "Dikkat Yanlılığı": cautionTestData,
                "Yorumlama Yanlılığı": interpretationTestData
            ]
        ]
        
        userDocRef.setData(sessionDataDict, merge: true) { error in
            if let error = error {
                print("Error saving session data: \(error.localizedDescription)")
            } else {
                print("Session data successfully saved!")
            }
        }
        
        self.createNewSession()
    }
}

// MARK: - Init Helpers
extension SessionManager {
    private func updateNickName() async {
        self.nickName = await AuthManager.shared.user?.email?.replacingOccurrences(of: "@gmail.com", with: "") ?? "Guest"
    }
    
    private func initializeSession() async {
        await updateNickName()
        determineNextSessionNumber { [weak self] nextSessionNumber in
            self?.sessionData = SessionData(sessionNumber: nextSessionNumber)
        }
    }
    
    func determineNextSessionNumber(completion: @escaping (Int) -> Void) {
        let userDocRef = db.collection("1A").document(nickName)
        
        userDocRef.getDocument { document, error in
            if let error = error {
                print("Error getting sessions: \(error.localizedDescription)")
            } else if let document = document, document.exists {
                let data = document.data() ?? [:]
                let sessionNumbers = data.keys.compactMap { key -> Int? in
                    if key.hasPrefix("Oturum-") {
                        return Int(key.replacingOccurrences(of: "Oturum-", with: ""))
                    }
                    return nil
                }
                let nextSessionNumber = (sessionNumbers.max() ?? 0) + 1
                completion(nextSessionNumber)
            } else {
                userDocRef.setData([:]) { error in
                    if let error = error {
                        print("Error creating document: \(error.localizedDescription)")
                    }
                    completion(1)
                }
            }
        }
    }
}

// MARK: - Data Helpers
extension SessionManager {
    func updateCautionTestData(_ data: CautionTestData) {
        sessionData.cautionTestData.append(data)
    }
    
    func updateInterpretationTestData(_ data: InterpretationTestData) {
        sessionData.interpretationTestData.append(data)
    }
    
    func createNewSession() {
        sessionData.cautionTestData.removeAll()
        sessionData.interpretationTestData.removeAll()
        determineNextSessionNumber { [weak self] nextSessionNumber in
            self?.sessionData = SessionData(sessionNumber: nextSessionNumber)
        }
    }
}
