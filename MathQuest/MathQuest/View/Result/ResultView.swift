//
//  ResultView.swift
//  MathQuest
//
//  Created by Erik Sebastian de Erice Jerez on 7/10/24.
//

import SwiftUI

struct ResultView: View {
    var score: Int
    var totalQuestions: Int
    var onRestart: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("You scored \(score) out of \(totalQuestions)")
                    .font(.title)
                
                switch Double(score) / Double(totalQuestions) {
                case 0.0...0.49:
                    Text("You need to practice more!")
                        .foregroundStyle(.red)
                case 0.5...0.79:
                    Text("You're doing well!")
                        .foregroundStyle(.orange)
                case 0.8...1.0:
                    Text("You're a math pro!")
                        .foregroundStyle(.green)
                default:
                    EmptyView()
                }
            }
            .navigationTitle("Final Score")
            .toolbar {
                Button("Play Again", action: onRestart)
            }
        }
    }
}

#Preview {
    ResultView(score: 8, totalQuestions: 10) { }
}
