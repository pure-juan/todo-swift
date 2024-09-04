//
//  Checkbox.swift
//  Todos
//
//  Created by 찌오 on 9/2/24.
//

import SwiftUI

struct Checkbox: View {
    var isOn: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .inset(by: 2)
                .stroke(Color.toggleBorder, lineWidth: 2)
                .background(Color.toggleBackground)
                .frame(width: 24, height: 24)
            if isOn {
                Image("checkbox_checkmark")
                    .renderingMode(.template)
                    .tint(Color.toggleForeground)
            }
        }
    }
}

#Preview {
    VStack {
        Checkbox(isOn: true)
        Checkbox(isOn: false)
    }
}
