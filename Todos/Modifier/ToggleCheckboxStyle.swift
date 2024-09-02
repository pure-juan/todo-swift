//
//  Checkbox.swift
//  Todos
//
//  Created by 찌오 on 8/30/24.
//

import Foundation
import SwiftUI

struct ToggleCheckboxStyle: ToggleStyle {
    @Environment(\.isEnabled) var isEnabled
    @EnvironmentObject var themeManager: ThemeManager
    
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
