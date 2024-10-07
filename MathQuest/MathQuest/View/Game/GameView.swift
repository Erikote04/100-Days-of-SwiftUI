//
//  GameView.swift
//  MathQuest
//
//  Created by Erik Sebastian de Erice Jerez on 7/10/24.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var gameVM: GameViewModel
    
    var onChangeSettings: () -> Void
    
    var body: some View {
        NavigationStack {
            if gameVM.currentQuestionIndex < gameVM.questions.count {
                Form {
                    Section("Question") {
                        Text(gameVM.questions[gameVM.currentQuestionIndex].question)
                            .font(.largeTitle)
                    }
                    
                    Section("Answear") {
                        TextField("Your answer", text: $gameVM.userAnswer)
                            .keyboardType(.decimalPad)
                    }
                }
                .navigationTitle("Table of \(gameVM.selectedTable)")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Settings", action: onChangeSettings)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Submit", action: gameVM.checkAnswer)
                    }
                }
            } else {
                Text("You've completed the quiz!")
                    .font(.title)
                    .padding()
            }
        }
        .sheet(isPresented: $gameVM.showResults) {
            ResultView(score: gameVM.score, totalQuestions: gameVM.questionCount) {
                gameVM.resetGame()
            }
        }
    }
}

#Preview {
    GameView(gameVM: GameViewModel(selectedTable: 2, questionCount: 2)) { }
}
