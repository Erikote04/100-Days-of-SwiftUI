//
//  RockPaperScissorsViewModel.swift
//  RockPaperScissors
//
//  Created by Erik Sebastian de Erice Jerez on 15/9/24.
//

import Foundation

final class RockPaperScissorsViewModel: ObservableObject {
    @Published var moves: [Move] = [
        Move(name: "Rock", icon: "👊"),
        Move(name: "Paper", icon: "✋"),
        Move(name: "Scissors", icon: "✌️"),
    ]
    
    @Published var winningMoves: [Move] = [
        Move(name: "Paper", icon: "✋"),
        Move(name: "Scissors", icon: "✌️"),
        Move(name: "Rock", icon: "👊"),
    ]
    
    @Published var currentMove = Int.random(in: 0...2)
    @Published var shouldWin = Bool.random()
    @Published var isShowingScore = false
    @Published var isShowingFinalScore = false
    @Published var scoreTitle = ""
    @Published var score = 0
    @Published var round = 0
    
    func moveTapped(_ number: Int) {
        let correctMove = shouldWin ? winningMoves[currentMove] : moves[(currentMove + 2) % 3]
        
        if moves[number].name == correctMove.name {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong, to \(shouldWin ? "win" : "lose") against \(moves[currentMove].name) you should've chosen \(correctMove.name)"
            score -= 1
        }
        
        isGameOver()
    }
    
    func startRound() {
        currentMove = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    
    func isGameOver() {
        round += 1
        
        if round == 10 {
            isShowingFinalScore = true
        } else {
            isShowingScore = true
        }
    }
    
    func reset() {
        score = 0
        round = 0
        startRound()
    }
}
