//
//  ContentView.swift
//  NikolaevAA_3.4
//
//  Created by Anton Nikolaev on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value = 0.0
    @State private var alpha = 0.4
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к:")
                .padding()
            HStack {
                Text("0")
                SliderToUIKitView(value: $value)
                    .opacity(alpha)
                Text("100")
            }.padding()
            Button(action: {}) {
                Text("проверить меня!")
            }
            .padding(.vertical, 20.0)
            Button(action: {}) {
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
