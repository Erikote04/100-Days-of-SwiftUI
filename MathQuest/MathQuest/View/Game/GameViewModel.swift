//
//  GameViewModel.swift
//  MathQuest
//
//  Created by Erik Sebastian de Erice Jerez on 7/10/24.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var currentQuestionIndex = 0
    @Published var userAnswer = ""
    @Published var score = 0
    @Published var showResults = false
    
    var selectedTable: Int
    var questionCount: Int
    
    init(selectedTable: Int, questionCount: Int) {
        self.selectedTable = selectedTable
        self.questionCount = questionCount
        generateQuestions()
    }
    
    func generateQuestions() {
        questions = (1...questionCount).map { _ in
            let randomMultiplier = Int.random(in: 2...10)
            let result = selectedTable * randomMultiplier
            return Question(multiplicand: selectedTable, multiplier: randomMultiplier)
        }
    }
    
    func checkAnswer() {
        guard currentQuestionIndex < questions.count else {
            showResults = true
            return
        }
        
        if let userAnswerInt = Int(userAnswer), userAnswerInt == questions[currentQuestionIndex].answer {
            score += 1
        }
        
        userAnswer = ""
        currentQuestionIndex += 1
        
        if currentQuestionIndex >= questions.count {
            showResults = true
        }
    }
    
    func resetGame() {
        currentQuestionIndex = 0
        score = 0
        userAnswer = ""
        showResults = false
        generateQuestions()
    }
}
