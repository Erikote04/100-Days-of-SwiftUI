import SwiftUI

struct ContentView: View {
    @State private var counries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswear = Int.random(in: 0...2)
    @State private var isShowingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                    
                    Text(counries[correctAnswear])
                        .foregroundStyle(.white)
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(counries[number])
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $isShowingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswear ? "Correct" : "Wrong"
        isShowingScore = true
    }
    
    func askQuestion() {
        counries.shuffle()
        correctAnswear = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
