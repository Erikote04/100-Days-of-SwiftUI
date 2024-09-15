import SwiftUI

struct RockPaperScissorsView: View {
    @StateObject private var vm = RockPaperScissorsViewModel()
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .cyan, location: 0.3),
                .init(color: .blue, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Rock, Paper, Scissors\nGO!")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Condition to meet")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(vm.shouldWin ? "WIN" : "LOSE")
                            .font(.title).bold()
                            .foregroundStyle(vm.shouldWin ? .green : .red)
                        
                        RoundButton(image: vm.moves[vm.currentMove].icon, size: 100)
                    }
                    
                    HStack(spacing: 15) {
                        ForEach(0..<3) { number in
                            Button {
                                vm.moveTapped(number)
                            } label: {
                                RoundButton(image: vm.moves[number].icon, size: 30)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                
                Text("Score: \(vm.score)")
                    .font(.title).bold()
                    .foregroundStyle(.white)
                
                Spacer()
                Spacer()
            }
            .padding()
        }
        .alert(vm.scoreTitle, isPresented: $vm.isShowingScore) {
            Button("Continue", action: vm.startRound)
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
    RockPaperScissorsView()
}
