import SwiftUI

struct ContentView: View {
    @State private var  leftDice = 1
    @State private var  rightDice = 1
    @State private var isRolling = false
    @State private var alertMessage = false
    
    var body: some View {
        ZStack {
            Color(red: 0.02, green: 0.38, blue: 0.15)
                .ignoresSafeArea(.all)
            
            VStack {
                Image("diceeLogo")
                Spacer()
                
                HStack {
                    DiceView(n: leftDice)
                    DiceView(n: rightDice)
                }
               
                HStack{
                    Text("Total Number: \(leftDice + rightDice)")
                        .foregroundStyle(.white)
                        .font(.title)
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                  animationDice()
                }) {
                    Text(isRolling ? "Rolling..." : "Roll")
                        .frame(width: 100, height: 50)
                        .foregroundColor(.white)
                        .font(.headline)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                }.disabled(isRolling)
                
                    
                }
            }
        }
    func animationDice(){
        isRolling = true
        var count = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            self.leftDice = Int.random(in: 1...6)
            self.rightDice = Int.random(in: 1...6)
            count += 1
            
            if count >= 10 {
                timer.invalidate()
                isRolling = false
            }
        }
       
    }
    }




struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

#Preview {
    ContentView()
}
