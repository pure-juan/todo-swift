//
//  TodosApp.swift
//  Todos
//
//  Created by Juan Kim on 8/29/24.
//

import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double(hex & 0xff) / 255
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

@main
struct TodosApp: App {
    var body: some Scene {
        WindowGroup {
            RootScreen()
        }
    }
}
