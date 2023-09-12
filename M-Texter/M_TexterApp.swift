//
//  M_TexterApp.swift
//  M-Texter
//
//  Created by 吴雲放 on 2023/9/11.
//

import SwiftUI

@main
@available(macOS 13.0, *)
struct M_TexterApp: App {
    
    var body: some Scene {

        MenuBarExtra {
            TexterView().frame(width: 300, height: 350)
        } label: {
            TexterContentView()
        }
        .menuBarExtraStyle(.window)
    }
}
