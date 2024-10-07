//
//  ContentView.swift
//  MathQuest
//
//  Created by Erik Sebastian de Erice Jerez on 7/10/24.
//

import SwiftUI

struct MathQuestView: View {
    @StateObject private var settingsVM = SettingsViewModel()
    @State private var gameVM: GameViewModel? = nil
    @State private var isGameActive = false
    @State private var showingSettings = true

    var body: some View {
        ZStack {
            if let gameVM = gameVM, isGameActive {
                GameView(gameVM: gameVM, onChangeSettings: showSettings)
            }
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView(settingsVM: settingsVM, onStart: startGame)
        }
    }

    func startGame() {
        gameVM = GameViewModel(selectedTable: settingsVM.selectedTable, questionCount: settingsVM.questionCount)
        isGameActive = true
        showingSettings = false
    }
    
    func showSettings() {
        showingSettings = true
    }
}

#Preview {
    MathQuestView()
}
