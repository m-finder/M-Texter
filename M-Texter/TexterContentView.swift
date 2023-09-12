//
//  TexterContentView.swift
//  M-Texter
//
//  Created by 吴雲放 on 2023/9/11.
//

import SwiftUI

struct TexterContentView: View {
    
    @AppStorage("Texter") var Texter: String = "Hello World"
    @AppStorage("Colorful") var colorful:  Bool = false
    @AppStorage("ColorIndex") var colorIndex: Int = 0
    // 色卡
    @ObservedObject var colorModel : ColorModel = ColorModel()
    
    var body: some View {
        
        let content = Text(Texter).font(.system(size: 26, weight: .heavy, design: .rounded))
        
        if colorful {
            // 文字图像化
            let renderer = ImageRenderer(content: content.foregroundStyle(LinearGradient(
                colors: colorModel.getColor(index: colorIndex),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )))
            
            let cgImage = renderer.cgImage
            if cgImage != nil {
                Image(cgImage!, scale: 2, label: Text(""))
            }
        } else {
            content
        }
    }
}

struct TexterContentView_Previews: PreviewProvider {
    static var previews: some View {
        TexterContentView()
    }
}
