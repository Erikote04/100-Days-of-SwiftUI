import SwiftUI

struct WordScrambleView: View {
    @StateObject private var vm = WordScrambleViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $vm.newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(vm.usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(vm.rootWord)
            .onAppear(perform: vm.startGame)
            .onSubmit(vm.addNewWord)
            .alert(vm.errorTitle, isPresented: $vm.isErrorVisible) {
                Button("OK") { }
            } message: {
                Text(vm.errorMessage)
            }
            .toolbar {
                Button("Restart") { vm.startGame() }
            }
            
            Text("Score: \(vm.score)")
                .font(.title)
                .foregroundStyle(.tint)
                .padding()
        }
    }
}

#Preview {
    WordScrambleView()
}
