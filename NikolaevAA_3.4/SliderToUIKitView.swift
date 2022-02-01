//
//  SliderToUIKitView.swift
//  NikolaevAA_3.4
//
//  Created by Anton Nikolaev on 01.02.2022.
//

import SwiftUI

struct SliderToUIKitView: UIViewRepresentable {
    
    @Binding var value: Double
   
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor(.red)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    typealias UIViewType = UISlider
    
    
    
    
    /*
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
     */
}


struct SliderToUIKitView_Previews: PreviewProvider {
    static var previews: some View {
        SliderToUIKitView(value: .constant(10))
    }
}
 
