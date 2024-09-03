//
//  Checkbox.swift
//  Todos
//
//  Created by 찌오 on 8/30/24.
//

import Foundation
import SwiftUI

struct ToggleCheckboxStyle: ToggleStyle {
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            ZStack() {
                if configuration.isOn {
                    Image("checkbox_checkmark")
                        .renderingMode(.template)
                        .foregroundStyle(themeManager.selectedTheme.toggleForegound)
                }
            }
            //                    .border(themeManager.selectedTheme.toggleBorder, width: 2)
//                .background(themeManager.selectedTheme.toggleBackground)
//                .background(Color.blue)
                .frame(width: 24, height: 24)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(themeManager.selectedTheme.toggleBackground)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 5.0)
//                        .inset(by: 2)
                        .strokeBorder(themeManager.selectedTheme.toggleBorder, lineWidth: 2)
//                        .background(Color.clear)
//                        .background(Color.red)
//                        .background(themeManager.selectedTheme.toggleBackground)
                }
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(!isEnabled)
    }
}
