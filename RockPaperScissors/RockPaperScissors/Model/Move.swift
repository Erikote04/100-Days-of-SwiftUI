//
//  Move.swift
//  RockPaperScissors
//
//  Created by Erik Sebastian de Erice Jerez on 15/9/24.
//

import Foundation

struct Move: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let icon: String
}
