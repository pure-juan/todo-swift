//
//  ToggleButtonStyle.swift
//  Todos
//
//  Created by Juan Kim on 9/2/24.
//

import Foundation
import SwiftUI

struct ToggleCheckboxStyle: ToggleStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 5.0)
                    .inset(by: 2)
                    .stroke(Color(hex: 0xDADADA), lineWidth: 2)
                    .background(Color(hex: 0xFCFCFC))
                    .frame(width: 24, height: 24)
                if configuration.isOn {
                    Image("checkbox_checkmark")
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(!isEnabled)
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double(hex & 0xff) / 255
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
