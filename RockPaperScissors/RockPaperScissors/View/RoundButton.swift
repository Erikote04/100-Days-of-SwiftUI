//
//  RoundButton.swift
//  RockPaperScissors
//
//  Created by Erik Sebastian de Erice Jerez on 15/9/24.
//

import SwiftUI

struct RoundButton: View {
    var image: String
    var size: CGFloat
    
    var body: some View {
        Text(image)
            .padding()
            .font(.system(size: size))
            .background(.secondary)
            .clipShape(.circle)
    }
}

#Preview {
    RoundButton(image: "👊", size: 100)
}
