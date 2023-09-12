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
        [.mint, .red],
        [.blue, .green, .red],
        [.green, .green, .blue],
        [.purple, .red, .purple],
        [.pink, .orange, .red]
    ]
    
    func getColor (index: Int) -> [Color] {
        return colors[index]
    }
    
    func getColors () -> [[Color]] {
        return colors
    }
}
