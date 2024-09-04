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
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            ZStack() {
                if configuration.isOn {
                    Image("checkbox_checkmark")
                        .renderingMode(.template)
                        .foregroundStyle(Color.toggleForeground)
                }
            }
            .frame(width: 24, height: 24)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.toggleBackground)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 5.0)
                    .strokeBorder(Color.toggleBorder, lineWidth: 2)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(!isEnabled)
    }
}
