//
//  InterpretationTestViewModel.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 15.05.2024.
//

import SwiftUI

class InterpretationTestViewModel: ObservableObject {
    @Published var interpretationQuestions: [InterpretationCategory] = []
    @Published var currentSession: [Question] = []
    @Published var neutralSession: [Question]?
    @Published var currentStep: ITStep = .welcomeMessage
    @Published var currentQuestionIndex: Int = 0
    @Published var isFirstSession: Bool = true
    @Published var isCorrectAnswer: Bool = false
    
    private var itSessionManager: ITSessionManager?
    private var currentQuestionData: InterpretationTestData?
    
    init() {
        generateSession()
    }
    
    private func generateSession() {
        if let categories = loadJSON(fileName: "interpretation_all") {
            self.interpretationQuestions = categories
            self.itSessionManager = ITSessionManager(categories: categories)
            
            if isFirstSession {
                if let neutralCategories = loadJSON(fileName: "interpretation_exercise") {
                    self.neutralSession = neutralCategories.first?.questions ?? []
                }
            }
            
            if let manager = itSessionManager {
                self.currentSession = manager.generateSession()
            }
        }
    }
    
    private func loadJSON(fileName: String) -> [InterpretationCategory]? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let categories = try? JSONDecoder().decode([InterpretationCategory].self, from: data) else {
            print("JSON dosyası yüklenemedi: \(fileName)")
            return nil
        }
        return categories
    }
    
    func getCurrentQuestion() -> Question? {
        if isFirstSession {
            guard let neutralSession = neutralSession,
                  currentQuestionIndex < neutralSession.count else {
                return nil
            }
            return neutralSession[currentQuestionIndex]
        } else {
            guard currentQuestionIndex < currentSession.count else {
                return nil
            }
            return currentSession[currentQuestionIndex]
        }
    }
    
    func updateAnswer(isCorrect: Bool) {
        isCorrectAnswer = isCorrect
    }
    
    func nextStep() {
        switch currentStep {
        case .welcomeMessage:
            currentStep = isFirstSession ? .trainingDescription : .sessionDescription
            
        case .trainingDescription:
            currentStep = .questionDescription
            
        case .questionDescription:
            currentStep = .firstQuestion
            
        case .firstQuestion:
            currentStep = .secondQuestion
            
        case .secondQuestion:
            currentStep = .secondQuestionResult
            
        case .secondQuestionResult:
            if isFirstSession {
                if currentQuestionIndex < 4 {
                    currentQuestionIndex += 1
                    currentStep = .questionDescription
                } else {
                    currentStep = .trainingFinish
                    currentQuestionIndex = 0
                }
            } else {
                if currentQuestionIndex < currentSession.count - 1 {
                    currentQuestionIndex += 1
                    currentStep = .questionDescription
                } else {
                    currentStep = .sessionFinish
                }
            }
            
        case .trainingFinish:
            isFirstSession = false
            currentStep = .sessionDescription
            
        case .sessionDescription:
            currentStep = .questionDescription
            
        case .sessionFinish:
            break
        }
    }
}

//MARK: - Firebase Helpers
extension InterpretationTestViewModel {
    func initializeCurrentQuestionData() {
        guard let currentQuestion = getCurrentQuestion() else { return }
        currentQuestionData = InterpretationTestData(
            timeStamp: Date().toDateAndTime(),
            questionDescription: currentQuestion.questionDescription,
            category: itSessionManager?.findCategory(for: currentQuestion) ?? "Nötr",
            firstQuestion: currentQuestion.firstQuestion,
            firstQuestionAnswer: currentQuestion.firstQuestionAnswer,
            givenFirstQuestionAnswer: "",
            firstQuestionResponseTime: 0,
            secondQuestion: currentQuestion.secondQuestion,
            secondQuestionAnswer: currentQuestion.secondQuestionAnswer.rawValue,
            givenSecondQuestionAnswer: "",
            isSecondQuestionAnswerCorrect: "",
            feedback: "",
            secondQuestionResponseTime: 0
        )
    }
    
    func updateFirstQuestionData(givenAnswer: String, responseTime: Int) {
        currentQuestionData?.givenFirstQuestionAnswer = givenAnswer
        currentQuestionData?.firstQuestionResponseTime = responseTime
    }
    
    func updateSecondQuestionData(givenAnswer: String, isCorrect: Bool, responseTime: Int) {
        currentQuestionData?.givenSecondQuestionAnswer = givenAnswer
        currentQuestionData?.isSecondQuestionAnswerCorrect = getFeedback(isCorrect)
        currentQuestionData?.feedback = getFeedback(isCorrect)
        currentQuestionData?.secondQuestionResponseTime = responseTime
        
        if let data = currentQuestionData {
            SessionManager.shared.updateInterpretationTestData(data)
        }
    }
    
    private func getFeedback(_ isCorrect: Bool) -> String {
        return isCorrect ? AppStrings.itCorrect : AppStrings.itIncorrect
    }
}
