//
//  ContentView.swift
//  Colorized
//
//  Created by Evgeni Glushko on 5.03.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = 127.0
    @State private var greenSliderValue = 127.0
    @State private var blueSliderValue = 127.0
    
    var body: some View {
        ZStack {
            Color(red: 83 / 255, green: 82 / 255, blue: 237 / 255)
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                ColorView(
                    redSliderValue: $redSliderValue,
                    greenSliderValue: $greenSliderValue,
                    blueSliderBalue: $blueSliderValue
                )
                
                SliderView(color: .red, sliderValue: $redSliderValue)
                SliderView(color: .green, sliderValue: $greenSliderValue)
                SliderView(color: .blue, sliderValue: $blueSliderValue)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct ColorView: View {
    @Binding var redSliderValue: Double
    @Binding var greenSliderValue: Double
    @Binding var blueSliderBalue: Double
    
    var body: some View {
        Rectangle()
            .frame(height: 180)
            .clipShape(.rect(cornerRadius: 15))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 4)
            )
            .foregroundStyle(
                Color(
                    red: redSliderValue / 255,
                    green: greenSliderValue / 255,
                    blue: blueSliderBalue / 255
                )
            )
    }
}
