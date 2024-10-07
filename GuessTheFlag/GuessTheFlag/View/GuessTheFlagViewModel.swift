//
//  GuessTheFlagViewModel.swift
//  GuessTheFlag
//
//  Created by Erik Sebastian de Erice Jerez on 9/9/24.
//

import Foundation

final class GuessTheFlagViewModel: ObservableObject {
    @Published var countries: [Flag] = [
        Flag(name: "Estonia", imageName: "Estonia"),
        Flag(name: "France", imageName: "France"),
        Flag(name: "Germany", imageName: "Germany"),
        Flag(name: "Ireland", imageName: "Ireland"),
        Flag(name: "Italy", imageName: "Italy"),
        Flag(name: "Nigeria", imageName: "Nigeria"),
        Flag(name: "Poland", imageName: "Poland"),
        Flag(name: "Spain", imageName: "Spain"),
        Flag(name: "United Kingdom", imageName: "UK"),
        Flag(name: "Ukraine", imageName: "Ukraine"),
        Flag(name: "United States", imageName: "US")
    ].shuffled()
    
    @Published var selectedFlag: Int? = nil
    @Published var correctAnswear = Int.random(in: 0...2)
    @Published var isShowingScore = false
    @Published var isShowingFinalScore = false
    @Published var scoreTitle = ""
    @Published var score = 0
    @Published var questionCount = 0
    
    func flagTapped(_ number: Int) {
        selectedFlag = number
        
        if number == correctAnswear {
            scoreTitle = "Correct!"
            score += 10
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number].name)."
            score -= 10
        }
        
        isGameOver()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswear = Int.random(in: 0...2)
        selectedFlag = nil
    }
    
    func isGameOver() {
        questionCount += 1
        
        if questionCount == 10 {
            isShowingFinalScore = true
        } else {
            isShowingScore = true
        }
    }
    
    func reset() {
        score = 0
        questionCount = 0
        askQuestion()
    }
}
