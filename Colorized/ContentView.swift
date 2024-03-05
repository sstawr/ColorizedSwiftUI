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
    
    @State private var redTextFieldValue = 127.0
    @State private var greenTextFieldValue = 127.0
    @State private var blueTextFieldValue = 127.0

    @State private var isPresented = false
    @FocusState private var keyboardFocused: Bool
    
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
                
                SliderView(color: .red, sliderValue: $redSliderValue, textFieldValue: $redTextFieldValue)
                SliderView(color: .green, sliderValue: $greenSliderValue, textFieldValue: $greenTextFieldValue)
                SliderView(color: .blue, sliderValue: $blueSliderValue, textFieldValue: $blueTextFieldValue)
                
                Spacer()
            }
            .padding()
        }
        
        .onTapGesture {
            hideKeyboard()
        }
        .alert("Wrong Format", isPresented: $isPresented, actions: {}) {
            Text("Enter correct data")
        }
        
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button(action: {
                    keyboardFocused = false
                    hideKeyboard()
                }, label: {
                    Text("Done")
                })
                .alert("Wrong Format", isPresented: $isPresented, actions: {}) {
                    Text("Enter correct data")
                }
            }
        }
    }
    
    private func hideKeyboard() {
        
        if (0...255).contains(redTextFieldValue){
            redSliderValue = redTextFieldValue
        } else {
            redTextFieldValue = redSliderValue
            isPresented.toggle()
        }
        
        if (0...255).contains(greenTextFieldValue){
            greenSliderValue = greenTextFieldValue
        } else {
            greenTextFieldValue = greenSliderValue
            isPresented.toggle()
        }
        
        if (0...255).contains(blueTextFieldValue){
            blueSliderValue = blueTextFieldValue
        } else {
            blueTextFieldValue = blueSliderValue
            isPresented.toggle()
        }

        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
