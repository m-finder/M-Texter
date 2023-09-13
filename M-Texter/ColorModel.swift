//
//  ColorProfile.swift
//  M-Texter
//
//  Created by 吴雲放 on 2023/9/12.
//
import SwiftUI
import Foundation

class ColorModel: ObservableObject{
    
    let colors: [[Color]] = [
        [.mint, .orange, .yellow],
        [.orange, .pink, .purple],
        [.red, .mint],
        [.blue, .green, .red],
        [.purple, .red, .pink],
        [Color(hex: 0x900C3F), Color(hex: 0xC70039), Color(hex: 0xF94C10)],
        [Color(hex: 0xFFD966), Color(hex: 0xF4B183), Color(hex: 0xDFA67B)],
    ]
    
    func getColor (index: Int) -> [Color] {
        if index > colors.count {
            return [.white]
        }
        return colors[index]
    }
    
    func getColors () -> [[Color]] {
        return colors
    }
}

// hex color
extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}