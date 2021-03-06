//
//  SliderToUIKitView.swift
//  NikolaevAA_3.4
//
//  Created by Anton Nikolaev on 01.02.2022.
//

import SwiftUI

struct SliderToUIKitView: UIViewRepresentable {
    @Binding var currentValue: Double
    var score: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: Double(score) / 100)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue),
            for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}



extension SliderToUIKitView {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func changeValue(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}


struct SliderToUIKitView_Previews: PreviewProvider {
    static var previews: some View {
        SliderToUIKitView(currentValue: .constant(10), score: 100)
    }
}
 
