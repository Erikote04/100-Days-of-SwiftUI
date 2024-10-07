//
//  SettingsViewModel.swift
//  MathQuest
//
//  Created by Erik Sebastian de Erice Jerez on 7/10/24.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var selectedTable = 2
    @Published var questionCount = 10
}
