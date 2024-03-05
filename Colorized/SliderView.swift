//
//  SliderView.swift
//  Colorized
//
//  Created by Evgeni Glushko on 5.03.24.
//

import SwiftUI

struct SliderView: View {
    let color: Color
    @Binding var sliderValue: Double
    @Binding var textFieldValue: Double
    
    var body: some View {
        HStack {
            Text(lround(sliderValue).formatted())
                .frame(width: 40)
                .foregroundStyle(.white)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
                .animation(.easeOut, value: sliderValue)
                .onChange(of: sliderValue, initial: true) { _, _ in
                    textFieldValue = sliderValue
                }
    
            TextField("Value", value: $textFieldValue, formatter: NumberFormatter())
                .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
                .frame(width: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.white, lineWidth: 1)
                )
                .foregroundStyle(Color.white)
                .keyboardType(.numberPad)
        }
    }
}

struct SliderViewPreviews: PreviewProvider {
    @State static var previewSliderValue = 50.0
    @State static var textFieldValue = 50.0
    
    static var previews: some View {
        SliderView(color: .red, sliderValue: $previewSliderValue, textFieldValue: $textFieldValue)
    }
}
