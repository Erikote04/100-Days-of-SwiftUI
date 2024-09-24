//
//  WordScrambleViewModel.swift
//  WordScramble
//
//  Created by Erik Sebastian de Erice Jerez on 24/9/24.
//

import SwiftUI

class WordScrambleViewModel: ObservableObject {
    @Published var usedWords = [String]()
    @Published var rootWord = ""
    @Published var newWord = ""
    
    @Published var errorTitle = ""
    @Published var errorMessage = ""
    @Published var isErrorVisible = false
    
    @Published var score = 0
    
    init() {
        startGame()
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                usedWords.removeAll()
                newWord = ""
                score = 0
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isLongEnough(word: answer) else {
            wordError(title: "Word is not long enough", message: "The word must have at least 3 characters")
            return
        }
        
        guard isNotEqualToRootWord(word: answer) else {
            wordError(title: "Word is equal to root word", message: "You only have to read the big title in your screen")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        score += calculateScore(word: answer)
        newWord = ""
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let index = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: index)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        
        return misspelledRange.location == NSNotFound
    }
    
    func isLongEnough(word: String) -> Bool {
        word.count >= 3
    }
    
    func isNotEqualToRootWord(word: String) -> Bool {
        word != rootWord
    }
    
    func calculateScore(word: String) -> Int {
        word.count
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        isErrorVisible = true
    }
}

