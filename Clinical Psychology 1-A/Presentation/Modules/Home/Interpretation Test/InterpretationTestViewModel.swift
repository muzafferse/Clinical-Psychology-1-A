//
//  InterpretationTestViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 15.05.2024.
//

import SwiftUI

struct InterpretationQuestion: Identifiable {
    let id = UUID()
    let questionDescription: String
    let firstQuestion: String
    let firstQuestionAnswer: String
    let secondQuestion: String
    let secondQuestionAnswer: Answer
    let type: QuestionType
}

class InterpretationTestViewModel: ObservableObject {
    let interpretationQuestions: [InterpretationQuestion] = [InterpretationQuestion(questionDescription: "Arkadaşlarınızla uzun zamandır beklediğiniz bir filme gitmeye karar veriyorsunuz. Sinema salonunun önüne geldiğinizde uzun bir kuyruk olduğunu görüyorsunuz. Bu kuyruk yüzünden… ",
                                                                                    firstQuestion: "filme g_ç kalıyorsunuz.",
                                                                                    firstQuestionAnswer: "e",
                                                                                    secondQuestion: "Filme zamanında girdiniz mi?",
                                                                                    secondQuestionAnswer: .no,
                                                                                    type: .neutral)
    ]
}
