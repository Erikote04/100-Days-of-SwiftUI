import SwiftUI

struct ContentView: View {
    @StateObject private var vm = GuessTheFlagViewModel()
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(vm.countries[vm.correctAnswear].name)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            vm.flagTapped(number)
                        } label: {
                            Image(vm.countries[number].imageName)
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(vm.score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(vm.scoreTitle, isPresented: $vm.isShowingScore) {
            Button("Continue", action: vm.askQuestion)
        } message: {
            Text("Your score is \(vm.score)")
        }
        .alert("Final Score", isPresented: $vm.isShowingFinalScore) {
            Button("Restart", action: vm.reset)
        } message: {
            Text("Your final score is \(vm.score)")
        }
    }
}

#Preview {
    ContentView()
}