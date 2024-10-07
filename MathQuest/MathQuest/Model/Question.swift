//
//  Question.swift
//  MathQuest
//
//  Created by Erik Sebastian de Erice Jerez on 7/10/24.
//

import Foundation

struct Question {
    let multiplicand: Int
    let multiplier: Int
    
    var question: String {
        "\(multiplicand) x \(multiplier) = ?"
    }
    
    var answer: Int {
        multiplicand * multiplier
    }
}
