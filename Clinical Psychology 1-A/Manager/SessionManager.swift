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
        let sessionRef = db.collection("1A").document(nickName).collection("sessions").document("session-\(sessionData.sessionNumber)")
        
        let cautionTestData = sessionData.cautionTestData.map { data in
            return [
                "testTarihi": data.timeStamp,
                "fotografCifti": data.photoPairNumber,
                "notrFotoPozisyonu": data.neutralPhotoPosition,
                "okbFotoPozisyonu": data.ocdPhotoPosition,
                "okYonu": data.arrowDirection,
                "OkPozisyonu": data.arrowPosition,
                "verilenCevap": data.givenAnswer,
                "cevapDogruMu": data.isAnswerCorrect,
                "yanitSüresi": data.responseTime
            ] as [String : Any]
        }
        
        let interpretationTestData = sessionData.interpretationTestData.map { data in
            return [
                "testTarihi": data.timeStamp,
                "soruAciklaması": data.questionDescription,
                "kategori": data.category,
                "birinciSoru": data.firstQuestion,
                "birinciSoruCevap": data.firstQuestionAnswer,
                "verilenBirinciSoruCevabı": data.givenFirstQuestionAnswer,
                "birinciSoruYanitSuresi": data.firstQuestionResponseTime,
                "ikinciSoru": data.secondQuestion,
                "ikinciSoruCevap": data.secondQuestionAnswer,
                "verilenIkinciSoruCevabı": data.givenSecondQuestionAnswer,
                "ikinciSoruCevabıDogruMu": data.isSecondQuestionAnswerCorrect,
                "geribildirim": data.feedback,
                "yanitSüresi": data.secondQuestionResponseTime
            ] as [String : Any]
        }
        
        let sessionDataDict: [String: Any] = [
            "cautionTest": cautionTestData,
            "interpretationTest": interpretationTestData
        ]
        
        sessionRef.setData(sessionDataDict) { error in
            if let error = error {
                print("Error saving session data: \(error.localizedDescription)")
            } else {
                print("Session data successfully saved!")
            }
        }
    }
}

//MARK: - Init Helpers
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
        let userRef = db.collection("1A").document(nickName)
        userRef.getDocument { document, error in
            if let error = error {
                print("Error getting document: \(error)")
            } else if let document = document, document.exists {
                let sessionNumbers = document.data()?.keys.compactMap { key in
                    Int(key.replacingOccurrences(of: "session-", with: ""))
                } ?? []
                let nextSessionNumber = (sessionNumbers.max() ?? 0) + 1
                completion(nextSessionNumber)
            } else {
                userRef.setData(["session-1": [:]]) { error in
                    if let error = error {
                        print("Error creating document: \(error.localizedDescription)")
                    } else {
                        print("Document created with initial session.")
                    }
                    completion(1)
                }
                completion(1)
            }
        }
    }
}

//MARK: - Data Helpers
extension SessionManager {
    func updateCautionTestData(_ data: CautionTestData) {
        sessionData.cautionTestData.append(data)
    }
    
    func updateInterpretationTestData(_ data: InterpretationTestData) {
        sessionData.interpretationTestData.append(data)
    }
    
    func clearSessionData() {
        sessionData.cautionTestData.removeAll()
        sessionData.interpretationTestData.removeAll()
    }
}
