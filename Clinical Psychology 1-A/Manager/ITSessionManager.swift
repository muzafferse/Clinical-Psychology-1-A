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
    private let questionsPerType = 3
    private var yesCount = 0
    private var noCount = 0
    
    init(categories: [InterpretationCategory]) {
        self.categories = categories
    }
    
    func generateSession() -> [Question] {
        var session: [Question] = []
        yesCount = 0
        noCount = 0
        
        // Select 3 questions per category
        for category in categories {
            let shuffledQuestions = category.questions.shuffled()
            let selectedQuestions = shuffledQuestions.prefix(questionsPerType)
            session.append(contentsOf: selectedQuestions)
        }
        
        // Check yes no counts
        yesCount = session.filter { $0.secondQuestionAnswer.rawValue == "EVET" }.count
        noCount = session.filter { $0.secondQuestionAnswer.rawValue == "HAYIR" }.count
        
        // Adjust yes no counts as equal
        while yesCount != 9 || noCount != 9 {
            if yesCount > 9 {
                adjustSession(session: &session, answer: .yes, replacement: .no)
            } else if noCount > 9 {
                adjustSession(session: &session, answer: .no, replacement: .yes)
            }
        }
        
        //Duplicate session for 36 questions
        session.append(contentsOf: session)
        
        //Shuffle session for randomizing
        return session.shuffled()
    }
    
    // Answer adjuster helper method
    private func adjustSession(session: inout [Question], answer: Answer, replacement: Answer) {
        if let indexToReplace = session.indices.filter({ session[$0].secondQuestionAnswer == answer }).randomElement() {
            let categoryOfRemovedQuestion = categories.first(where: { $0.questions.contains(session[indexToReplace]) })

            if let category = categoryOfRemovedQuestion {
                let availableQuestions = category.questions.filter {
                    $0.secondQuestionAnswer == replacement && !session.contains($0)
                }
                if let replacementQuestion = availableQuestions.randomElement() {
                    session[indexToReplace] = replacementQuestion
                    if answer == .yes {
                        yesCount -= 1
                        noCount += 1
                    } else {
                        noCount -= 1
                        yesCount += 1
                    }
                }
            }
        }
    }
}
