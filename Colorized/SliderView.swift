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
    
    var body: some View {
        HStack {
            Text(lround(sliderValue).formatted())
                .frame(width: 35)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
        }
    }
}

struct SliderViewPreviews: PreviewProvider {
    @State static var previewSliderValue: Double = 50.0 // Создаем переменную для превью
    
    static var previews: some View {
        SliderView(color: .red, sliderValue: $previewSliderValue)
    }
}
