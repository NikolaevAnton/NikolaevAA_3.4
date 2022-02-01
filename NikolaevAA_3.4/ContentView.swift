//
//  ContentView.swift
//  NikolaevAA_3.4
//
//  Created by Anton Nikolaev on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue = 0.0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showingAlert = false
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .padding()
            HStack {
                Text("0")
                SliderToUIKitView(
                    currentValue: $currentValue)
                    .opacity(Double(computeScore()) / 100)
                Text("100")
            }.padding()
            Button("проверь меня!") {
                showingAlert = true
            }
            .alert("количество очков:\n \(computeScore())", isPresented: $showingAlert)
            {
                Button("OK") { }
            }
            .padding(.vertical, 20.0)
            Button(action: {
                currentValue = 0.0
                targetValue = Int.random(in: 0...100)
            }) {
                Text("начать заново")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
