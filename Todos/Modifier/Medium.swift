//
//  Medium.swift
//  Todos
//
//  Created by Juan Kim on 9/2/24.
//

import SwiftUI

struct Medium: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    func body(content: Content) -> some View {
        content
            .font(themeManager.selectedTheme.medium)
    }
}

extension View {
    func medium() -> some View {
        self.modifier(Medium())
    }
}
