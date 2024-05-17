import SwiftUI

struct ContentView: View {
    @State private var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US",
    ].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var wrongAnswear = ""
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionCount = 0
    @State private var opacity = [1.0, 1.0, 1.0]
    @State private var scale: [CGFloat] = [1.0, 1.0, 1.0]
    
    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                center: .top,
                startRadius: 200,
                endRadius: 700
            ).ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of: ")
                            .foregroundStyle(.secondary)
                            .font(.subheadline)
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        FlagImage(country: countries[number], opacity: $opacity[number], scale: $scale[number]) {
                            flagTapped(number)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            scoreTitle == "Wrong" ?
            Text("That's the flag of \(wrongAnswear).\n Your score is \(score)") :
            Text("Your score is \(score)")
        }
        .alert("Game Over", isPresented: $showingFinalScore) {
            Button("Restart", action: resetGame)
        } message: {
            Text("Your final score is \(score)/8")
        }
    }
    
    private func flagTapped(_ number: Int) {
        withAnimation {
            for index in 0..<3 {
                if index == number {
                    opacity[index] = 1.0
                    scale[index] = 1.0
                } else {
                    opacity[index] = 0.25
                    scale[index] = 0.8
                }
            }
        }
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            wrongAnswear = countries[number]
            score -= 1
        }
        
        showingScore = true
        questionCount += 1
        
        if questionCount >= 8 {
            showingFinalScore = true
        }
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        withAnimation {
            opacity = [1.0, 1.0, 1.0]
            scale = [1.0, 1.0, 1.0]
        }
    }
    
    private func resetGame() {
        score = 0
        questionCount = 0
        showingScore = false
        askQuestion()
    }
}

struct FlagImage: View {
    var country: String
    @Binding var opacity: Double
    @Binding var scale: CGFloat
    var action: () -> Void
    
    @State private var rotation: Double = 0
    
    var body: some View {
        Button {
            withAnimation {
                rotation += 360
            }
            action()
        } label: {
            Image(country)
                .clipShape(Capsule())
                .shadow(radius: 5)
                .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                .opacity(opacity)
                .scaleEffect(scale)
        }
    }
}

#Preview {
    ContentView()
}
