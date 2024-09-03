//
//  Counter.swift
//  Todos
//
//  Created by 찌오 on 9/3/24.
//

import SwiftUI

struct Counter<Content>: View where Content: View {
    @EnvironmentObject var themeManager: ThemeManager
    @ViewBuilder let content: Content
    
    var body: some View {
        content
            .frame(width: 15, height: 15)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(themeManager.selectedTheme.toggleBackground)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 5.0)
                    .strokeBorder(themeManager.selectedTheme.toggleBorder, lineWidth: 2)
            }
    }
}

#Preview {
    Counter {
        Text("5")
    }
}
