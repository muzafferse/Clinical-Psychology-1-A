//
//  ITSessionManager.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 29.12.2024.
//

import SwiftUI

class ITSessionManager {
    
    //TODO: Check if works well
    private var categories: [InterpretationCategory]
    private let trialsPerSession = 36
    private let questionsPerType = 3

    init(categories: [InterpretationCategory]) {
        self.categories = categories
    }

    func generateSession() -> [Question] {
        var sessionQuestions: [Question] = []

        // Shuffle categories
        let shuffledCategories = categories.shuffled()

        for category in shuffledCategories {
            let shuffledQuestions = category.questions.shuffled()

            // Select 3 questions per category
            sessionQuestions.append(contentsOf: shuffledQuestions.prefix(questionsPerType))
        }

        // Duplicate the selected questions to meet the required trial count
        sessionQuestions.append(contentsOf: sessionQuestions)

        // Ensure randomized order
        sessionQuestions.shuffle()

        return sessionQuestions.prefix(trialsPerSession).shuffled()
    }
}
