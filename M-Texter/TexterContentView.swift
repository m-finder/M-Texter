//
//  TexterContentView.swift
//  M-Texter
//
//  Created by 吴雲放 on 2023/9/11.
//

import SwiftUI

struct TexterContentView: View {
  
  @AppStorage("Texter") var Texter: String = String(localized: "Hello World")
  @AppStorage("Colorful") var colorful:  Bool = false
  @AppStorage("ColorIndex") var colorIndex: Int = 0
  
  var body: some View {
    
    let content = Text(Texter).font(.system(size: 26, weight: .heavy, design: .rounded))
    
    if colorful {
      // 文字图像化
      let renderer = ImageRenderer(content: content.foregroundStyle(LinearGradient(
        colors: ColorModel.shared.getColor(index: colorIndex),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )))

      if let cgImage = renderer.cgImage {
        Image(cgImage, scale: 2, label: Text(""))
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
