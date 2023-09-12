//
//  TexterView.swift
//  M-Texter
//
//  Created by 吴雲放 on 2023/9/11.
//

import SwiftUI
import ServiceManagement

struct TexterView: View {
    
    @AppStorage("Texter") var Texter: String = "Hello World"
    @AppStorage("Colorful") var colorful:  Bool = false
    
    // 开机自启
    @AppStorage("StartUp") var startUp: Bool = false
    @AppStorage("ColorIndex") var colorIndex: Int = 0

    // 色卡
    @ObservedObject var colorModel : ColorModel = ColorModel()
    
    var body: some View {
        VStack(alignment: .center) {
            Image("AppLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)

            Text("M-Texter")
                .font(.system(size: 24, weight: .semibold, design: .rounded))
                .foregroundStyle(LinearGradient(
                    colors: colorModel.getColor(index: colorIndex),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))

            VStack(alignment: .leading) {

                Divider()

                Text("Show text on menu bar")
                TextField("Input something", text: $Texter)
                    .textFieldStyle(.roundedBorder)
            }

            Divider()
            Spacer().frame(height: 20)
            HStack(alignment: .center, spacing: 10){

                Toggle("Colorful", isOn: $colorful)
                .toggleStyle(SwitchToggleStyle())
                .font(.system(size: 12))

                Divider().frame(height: 40)

                Toggle("Launch on Startup", isOn: $startUp)
                    .onChange(of: startUp, perform: { newValue in
                        if newValue {
                            if SMAppService.mainApp.status == .enabled {
                                try? SMAppService.mainApp.unregister()
                            }
                        
                            try? SMAppService.mainApp.register()
                        } else {
                            try? SMAppService.mainApp.unregister()
                        }
                    })
                    .toggleStyle(SwitchToggleStyle())
                    .font(.system(size: 12))
            }
            
            if colorful {
                HStack(alignment: .center, spacing: 10){
                    ForEach(colorModel.getColors().indices, id: \.self) { index in
                        Button {
                            colorIndex = index
                        } label: {

                            Image(systemName: colorIndex == index ? "checkmark.square.fill" : "square.fill")
                                .foregroundStyle(LinearGradient(
                                    colors: colorModel.getColor(index: index),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))

                        }.buttonStyle(.plain)

                    }
                }
            }
            
            
            Button("Quit App") {
                NSApplication.shared.terminate(nil)
            }
            .keyboardShortcut("q")
            .frame(width: 100, height: 40)
            .font(.body)
            .cornerRadius(10)
            
            Text("Made By M-finder 🚀")
              .font(.footnote)
              .fontWeight(.light)
              .padding(.top)
            
        }
        .padding()
    }
}

struct TexterView_Previews: PreviewProvider {
    static var previews: some View {
        TexterView()
    }
}

