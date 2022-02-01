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
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .padding()
            HStack {
                Text("0")
                SliderToUIKitView(
                    currentValue: $currentValue,
                    score: computeScore())
                Text("100")
            }.padding()
            Button("проверь меня!") {
                showingAlert = true
            }
            .padding(.vertical, 20.0)
            Button("начать заново") {
                currentValue = 0.0
                targetValue = Int.random(in: 0...100)
            }
        }
        .alert("количество очков:\n \(computeScore())", isPresented: $showingAlert)
        {
            Button("OK") { }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
